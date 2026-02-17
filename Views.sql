-- Views are virtual tables that are based on the result-set of an SQL statement. 
-- They can contain all or some of the columns from one or more tables. 
-- Views do not store data themselves, but they provide a way to look at data from one or more tables in a specific way.

CREATE DATABASE PracticeDB3;
USE	PracticeDB3;

-- Create Department Table
CREATE TABLE Department
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50)
)
INSERT INTO Department VALUES(1, 'IT')
INSERT INTO Department VALUES(2, 'HR')
INSERT INTO Department VALUES(3, 'Sales')

-- Create Employee Table
CREATE TABLE Employee
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  DOB DATETIME,
  DeptID INT
)
GO
INSERT INTO Employee VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 1)
INSERT INTO Employee VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 2)
INSERT INTO Employee VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 2)
INSERT INTO Employee VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 3)
INSERT INTO Employee VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 1)
INSERT INTO Employee VALUES(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 2)
GO

-- View with all columns (simple view)
CREATE VIEW vwAllEmployees1 
AS 
SELECT * FROM Employee

-- Using view (Insert / Update / Delete allowed in simple view)
INSERT INTO vwAllEmployees1 (ID, Name, Gender, DOB, DeptID) VALUES(7, 'Rohit', 'Male', '1995-04-19 10:53:27.060', 3)
SELECT * FROM vwAllEmployees1
SELECT * FROM Employee -- DATA also inserted in table

UPDATE vwAllEmployees1 SET
  Name = 'Rohit Kumar',
  DOB = '1996-02-29 10:53:27.060',
  DeptID = 1
WHERE ID = 7

DELETE FROM vwAllEmployees1 where ID = 7



-- Complex View with join
CREATE VIEW vwAllEmployees3
AS 
SELECT emp.ID, emp.Name, emp.Gender, emp.DOB, 
  dep.Name as DepartmentName
FROM Employee emp
INNER JOIN Department dep
on emp.DeptID = dep.ID

-- simple view with aggregate function treated as complex view
CREATE VIEW vwAllEmployees4
AS 
SELECT Gender, Count(*) as TotalEmployee
FROM Employee Group BY Gender


-- command to drop view
Drop view vwAllEmployees1


-- View with specific columns
CREATE VIEW vwAllEmployees2 
AS 
SELECT ID, Name, Gender, DOB, DeptID 
FROM Employee