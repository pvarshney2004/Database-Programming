-- CTE(Common Table Expression) is a temporary result set that you can reference within a SELECT, 
-- INSERT, UPDATE, or DELETE statement.
-- Defined using WITH clause. Improves readability and simplifies complex queries.

CREATE TABLE Employees
(
	ID int,
	LastName varchar(50),
	FirstName varchar(50),
	Age int
);
INSERT INTO Employees (ID, LastName, FirstName, Age) VALUES (1, 'Smith', 'John', 30);
INSERT INTO Employees (ID, LastName, FirstName, Age) VALUES (2, 'Doe', 'Jane', 25);
INSERT INTO Employees (ID, LastName, FirstName, Age) VALUES (3, 'Brown', 'Charlie', 35);
INSERT INTO Employees (ID, LastName, FirstName, Age) VALUES (4, 'Johnson', 'Emily', 28);
INSERT INTO Employees (ID, LastName, FirstName, Age) VALUES (5, 'Davis', 'Michael', 40);

-- Example:
-- Find employees whose age > average age

-- 1. without CTE
SELECT ID, FirstName, LastName FROM Employees
WHERE Age > (SELECT AVG(Age) FROM Employees);

-- 2. with CTE
WITH AverageAgeCTE AS
(
	SELECT AVG(Age) AS AverageAge FROM Employees
)
SELECT ID, FirstName, LastName FROM Employees, AverageAgeCTE -- Cross join with single-row CTE result
WHERE Age > AverageAge


-- creating a sample employee table 
CREATE TABLE Employee
(
	ID int,
	LastName varchar(50),
	FirstName varchar(50),
	Age int,
	Department varchar(50),
	Salary int
);

INSERT INTO Employee (ID, LastName, FirstName, Age, Department, Salary) VALUES (1, 'Smith', 'John', 30, 'IT', 60000);
INSERT INTO Employee (ID, LastName, FirstName, Age, Department, Salary) VALUES (2, 'Doe', 'Jane', 25, 'HR', 50000);
INSERT INTO Employee (ID, LastName, FirstName, Age, Department, Salary) VALUES (3, 'Brown', 'Charlie', 35, 'IT', 70000);
INSERT INTO Employee (ID, LastName, FirstName, Age, Department, Salary) VALUES (4, 'Johnson', 'Emily', 28, 'HR', 55000);
INSERT INTO Employee (ID, LastName, FirstName, Age, Department, Salary) VALUES (5, 'Davis', 'Michael', 40, 'IT', 80000);
INSERT INTO Employee (ID, LastName, FirstName, Age, Department, Salary) VALUES (6, 'Wilson', 'Sarah', 32, 'HR', 60000);

-- CREATING a CTE to Calculate Average Salary by Department
WITH AverageCTEbyDept AS (
	SELECT Department, AVG(Salary) AS AverageSalary
	FROM Employee
	GROUP BY Department
)
SELECT * from AverageCTEbyDept