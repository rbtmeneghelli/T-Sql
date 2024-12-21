-- Define a Common Table Expression (CTE)
WITH HighEarningEmployees AS (
    SELECT EmployeeID, FirstName, LastName, Salary
    FROM Employees
    WHERE Salary > 50000
)
-- Use the CTE to select high-earning employees
SELECT EmployeeID, FirstName, LastName
FROM HighEarningEmployees;