-- Exemplo de Uso dessa função
--SELECT e.CNPJ, v.Valido
--FROM Empresas e
--CROSS APPLY dbo.fn_ValidarCNPJ_Fast(e.CNPJ) v;

CREATE OR ALTER FUNCTION dbo.fn_ValidarCNPJ_Fast (@cnpj NVARCHAR(50))
RETURNS TABLE
AS
RETURN
WITH N AS (
    SELECT TOP (LEN(@cnpj))
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects
),

-- Sanitiza e já posiciona
Base AS (
    SELECT 
        n,
        UPPER(SUBSTRING(@cnpj, n, 1)) AS ch
    FROM N
    WHERE SUBSTRING(@cnpj, n, 1) LIKE '[A-Za-z0-9]'
),

-- Garante 14 posições
CNPJ AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY n) AS pos,
        ch
    FROM Base
),

ValidacaoInicial AS (
    SELECT COUNT(*) AS qtd
    FROM CNPJ
),

Valores AS (
    SELECT 
        pos,
        ASCII(ch) - 48 AS valor,
        ch
    FROM CNPJ
),

DV1Calc AS (
    SELECT 
        SUM(v.valor * p.peso) AS soma
    FROM Valores v
    JOIN (VALUES
        (1,5),(2,4),(3,3),(4,2),(5,9),(6,8),
        (7,7),(8,6),(9,5),(10,4),(11,3),(12,2)
    ) p(pos, peso) ON v.pos = p.pos
),

DV1 AS (
    SELECT 
        CASE WHEN soma % 11 < 2 THEN 0 ELSE 11 - (soma % 11) END AS dv1
    FROM DV1Calc
),

DV2Calc AS (
    SELECT 
        SUM(
            CASE 
                WHEN v.pos <= 12 THEN v.valor * p.peso
                WHEN v.pos = 13 THEN d.dv1 * p.peso
            END
        ) AS soma
    FROM Valores v
    JOIN (VALUES
        (1,6),(2,5),(3,4),(4,3),(5,2),(6,9),
        (7,8),(8,7),(9,6),(10,5),(11,4),(12,3),(13,2)
    ) p(pos, peso) ON v.pos = p.pos
    CROSS JOIN DV1 d
),

DV2 AS (
    SELECT 
        CASE WHEN soma % 11 < 2 THEN 0 ELSE 11 - (soma % 11) END AS dv2
    FROM DV2Calc
),

Final AS (
    SELECT 
        v.qtd,
        MAX(CASE WHEN pos = 13 THEN ch END) AS dv1_informado,
        MAX(CASE WHEN pos = 14 THEN ch END) AS dv2_informado
    FROM Valores
    CROSS JOIN ValidacaoInicial v
    GROUP BY v.qtd
)

SELECT
    CASE
        WHEN f.qtd <> 14 THEN 0
        WHEN f.dv1_informado NOT LIKE '[0-9]' THEN 0
        WHEN f.dv2_informado NOT LIKE '[0-9]' THEN 0
        WHEN EXISTS (
            SELECT 1
            FROM Valores
            GROUP BY ch
            HAVING COUNT(*) = 14
        ) THEN 0
        WHEN CONCAT(d1.dv1, d2.dv2) = CONCAT(f.dv1_informado, f.dv2_informado) THEN 1
        ELSE 0
    END AS Valido
FROM Final f
CROSS JOIN DV1 d1
CROSS JOIN DV2 d2;