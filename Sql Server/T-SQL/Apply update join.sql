UPDATE t1
SET t1.CalculatedColumn = t2.[Calculated Column]
FROM dbo.Table1 AS t1
INNER JOIN dbo.Table2 AS t2
ON t1.CommonField = t2.[Common Field]
WHERE t1.BatchNo = '110';