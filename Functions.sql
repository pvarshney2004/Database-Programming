--FUNCTIONS IN SQL SERVER

-- Built-in string functions
SELECT ABS(-5) AS AbsoluteValue; -- Returns the absolute value of a number

SELECT ASCII('A') AS AsciiValue; -- Returns the ASCII code of character
Select ASCII('A') as UpperCase, ASCII('a') as LowerCase

SELECT CHAR(65) AS Character; -- Returns the character for the given ASCII code

-- Printing uppercase alphabets using CHAR() function
DECLARE @Number int
SET @Number = 65
WHILE(@Number <= 90)
BEGIN
  PRINT CHAR(@Number)
  SET @Number = @Number + 1
END


Select LTRIM('   Hello') -- Removes leading spaces from a string
Select RTRIM('World   ') -- Removes trailing spaces from a string
Select LTRIM(RTRIM('   Hello   ')) -- Removes both leading and trailing spaces from a string
SELECT LEN('Hello World') AS StringLength; -- Returns the length of a string
SELECT LOWER('HELLO') AS LowerCase; -- Converts a string to lowercase
SELECT UPPER('hello') AS UpperCase; -- Converts a string to uppercase
SELECT REVERSE('HelloWorld') AS ReversedString; -- Reverses a string
SELECT LEFT('HelloWorld', 5) AS LeftPart; -- Returns the left part of a string upto the index
SELECT RIGHT('HelloWorld', 3) AS RightPart; -- Returns the right part of a string upto the index
SELECT CHARINDEX('World', 'Hello World') AS CharIndex; -- Returns the starting position of a substring in a string
SELECT SUBSTRING('Hello World', 7, 2) AS Substring; -- Returns a substring from a string starting at a specified position and length

-- OVER CLAUSE in SQL Server
CREATE TABLE Employees
(
     ID INT,
     Name VARCHAR(50),
     Department VARCHAR(50),
     Salary int
)
Go

INSERT INTO Employees Values (1, 'James', 'IT', 15000)
INSERT INTO Employees Values (2, 'Smith', 'IT', 35000)
INSERT INTO Employees Values (3, 'Rasol', 'HR', 15000)
INSERT INTO Employees Values (4, 'Rakesh', 'Payroll', 35000)
INSERT INTO Employees Values (5, 'Pam', 'IT', 42000)
INSERT INTO Employees Values (6, 'Stokes', 'HR', 15000)
INSERT INTO Employees Values (7, 'Taylor', 'HR', 67000)
INSERT INTO Employees Values (8, 'Preety', 'Payroll', 67000)
INSERT INTO Employees Values (9, 'Priyanka', 'Payroll', 55000)
INSERT INTO Employees Values (10, 'Anurag', 'Payroll', 15000)
INSERT INTO Employees Values (11, 'Marshal', 'HR', 55000)
INSERT INTO Employees Values (12, 'David', 'IT', 96000)

SELECT  Name, 
 Salary, 
 Department,
 COUNT(Department) OVER(PARTITION BY Department) AS DepartmentTotals
FROM Employees


-- RANK AND DENSE_RANK FUNCTIONS IN SQL SERVER
SELECT Name, Department, Salary,
RANK() OVER (ORDER BY Salary DESC) AS [Rank]
FROM Employees

SELECT Name, Department, Salary,
RANK() OVER (
PARTITION BY Department
ORDER BY Salary DESC) AS [Rank]
FROM Employees

SELECT Name, Department, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS [Rank]
FROM Employees

SELECT Name, Department, Salary,
DENSE_RANK() OVER (
PARTITION BY Department
ORDER BY Salary DESC) AS DenseRank
FROM Employees