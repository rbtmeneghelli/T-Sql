WITH RECURSIVE Fatorial(n, resultado) AS (
    -- Caso base: fatorial de 0 é 1
    SELECT 0, 1
    UNION ALL
    -- Passo recursivo: fatorial de n é n * fatorial de (n-1)
    SELECT n + 1, (n + 1) * resultado
    FROM Fatorial
    WHERE n < 5  -- Vamos calcular o fatorial até 5
)
SELECT * FROM Fatorial;
