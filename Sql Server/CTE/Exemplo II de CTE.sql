-- Define the CTE
WITH OrderDetails AS (
    SELECT o.OrderID, c.CustomerName, p.Price, o.Quantity, o.OrderDate
    FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN Products p ON o.ProductID = p.ProductID
    WHERE YEAR(o.OrderDate) = 2024
)
--Main query
SELECT CustomerName, SUM(Price * Quantity) AS TotalRevenue
FROM OrderDetails
GROUP BY CustomerName
HAVING SUM(Price * Quantity) > 1000;