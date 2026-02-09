--SUBQUERY IN MSSQL

CREATE TABLE Orders (
	OrderId INT PRIMARY KEY,
	CustomerId INT,
	OrderStatus VARCHAR(50),
	OrderDate DATETIME
);

INSERT INTO Orders (OrderId, CustomerId, OrderStatus, OrderDate) VALUES
(1, 101, 'Completed', '2024-01-15'),
(2, 102, 'Pending', '2024-02-20'),
(3, 101, 'Completed', '2024-03-10'),
(4, 103, 'Cancelled', '2024-04-05'),
(5, 102, 'Completed', '2024-05-12'),
(6, 101, 'Pending', '2017-06-01'),
(7, 103, 'Completed', '2018-07-20'),
(8, 102, 'Cancelled', '2017-08-15')

CREATE TABLE Customers (
	CustomerId INT PRIMARY KEY,
	CustomerName VARCHAR(100),
	City VARCHAR(50)
);
INSERT INTO Customers (CustomerId, CustomerName, City) VALUES
(101, 'Alice Smith', 'New York'),
(102, 'Bob Johnson', 'Los Angeles'),
(103, 'Charlie Brown', 'Chicago');

-- Subquery to find customers from a city and their orders
SELECT OrderId, CustomerId, OrderDate, OrderStatus from Orders
WHERE CustomerId IN (
	SELECT CustomerId FROM Customers
	WHERE City = 'Los Angeles'
)
ORDER BY OrderDate DESC;


-- Subquery to find customers who have made orders in 2017
SELECT
    CustomerId, CustomerName, City
FROM
    Customers c
WHERE
    EXISTS (
        SELECT
            CustomerId
        FROM
            Orders o
        WHERE YEAR (OrderDate) = 2017 and o.CustomerId = c.CustomerId
) ORDER BY CustomerName DESC;

--same task using join
SELECT DISTINCT c.CustomerId, c.CustomerName, c.City from Customers c
JOIN Orders o ON c.CustomerId = o.CustomerId
WHERE YEAR (o.OrderDate) = 2017

-- SQL Server subquery in the FROM clause
SELECT CustomerId from (
	SELECT CustomerId FROM Orders
	WHERE YEAR (OrderDate) = 2017
) T