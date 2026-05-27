-- Exemplo de Uso dessa função
--SELECT c.CPF, v.IsValid
--FROM Clientes c
--CROSS APPLY dbo.CpfValidation_iTVF(c.CPF) v

CREATE OR ALTER FUNCTION dbo.CpfValidation_iTVF (@vrCPF VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
    WITH Clean AS (
        SELECT
            value = REPLACE(REPLACE(@vrCPF, '.', ''), '-', '')
    ),
    ValidBase AS (
        SELECT value
        FROM Clean
        WHERE LEN(value) = 11
          AND value <> REPLICATE(SUBSTRING(value,1,1),11)
          AND value <> '12345678909'
    ),
    N AS (
        SELECT TOP (11)
            ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS pos
        FROM sys.all_objects
    ),
    D AS (
        SELECT
            n.pos,
            num = CAST(SUBSTRING(v.value, n.pos, 1) AS INT),
            v.value
        FROM ValidBase v
        CROSS JOIN N
    ),
    Calc AS (
        SELECT
            value,
            soma1 = SUM(CASE WHEN pos <= 9 THEN (11 - pos) * num END),
            soma2 = SUM(CASE WHEN pos <= 10 THEN (12 - pos) * num END),
            dig1  = MAX(CASE WHEN pos = 10 THEN num END),
            dig2  = MAX(CASE WHEN pos = 11 THEN num END)
        FROM D
        GROUP BY value
    )
    SELECT
        IsValid =
            CASE
                WHEN
                    (
                        CASE
                            WHEN soma1 % 11 IN (0,1) THEN 0
                            ELSE 11 - (soma1 % 11)
                        END
                    ) = dig1
                AND
                    (
                        CASE
                            WHEN soma2 % 11 IN (0,1) THEN 0
                            ELSE 11 - (soma2 % 11)
                        END
                    ) = dig2
                THEN CAST(1 AS BIT)
                ELSE CAST(0 AS BIT)
            END
    FROM Calc
);