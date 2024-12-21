WITH ProductSales AS (
    -- Step 1: Calculate total sales for each product
    SELECT ProductID, SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
),
AverageSales AS (
    -- Step 2: Calculate the average total sales across all products
    SELECT AVG(TotalSales) AS AverageTotalSales
    FROM ProductSales
),
HighSalesProducts AS (
    -- Step 3: Filter products with above-average total sales
    SELECT ProductID, TotalSales
    FROM ProductSales
    WHERE TotalSales > (SELECT AverageTotalSales FROM AverageSales)
)

-- Step 4: Rank the high-sales products
SELECT ProductID, TotalSales, RANK() OVER (ORDER BY TotalSales DESC) AS SalesRank
FROM HighSalesProducts;

-- O primeiro CTE (ProductSales) calcula o total de vendas por produto.
-- O segundo CTE (AverageSales) calcula o total médio de vendas de todos os produtos.
-- O terceiro CTE (HighSalesProducts) filtra os produtos cujas vendas totais excedem a média.
-- A consulta final classifica esses produtos com base em suas vendas totais.