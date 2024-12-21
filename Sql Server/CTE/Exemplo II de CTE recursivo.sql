;WITH CTE_Recursivo AS (
    -- Nível 1 (Âncora)
    SELECT Id_Empregado, Nm_Empregado, Id_Superior, 1 AS Nivel
    FROM #Funcionarios
    WHERE Id_Superior IS NULL

    UNION ALL

    -- Níveis 2-N
    SELECT A.Id_Empregado, A.Nm_Empregado, A.Id_Superior, B.Nivel + 1 AS Nivel
    FROM #Funcionarios A
    JOIN CTE_Recursivo B ON A.Id_Superior = B.Id_Empregado
)
SELECT *
FROM CTE_Recursivo