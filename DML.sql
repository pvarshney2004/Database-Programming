-- DML commands in SQL Server: Insert, Update, Delete

USE PracticeDB1

CREATE TABLE Employee(
	Id INT PRIMARY KEY,
	Name VARCHAR(50),
	Age INT,
	Department VARCHAR(50)
)

-- Insert data into the Employee table
INSERT INTO Employee (Id, Name, Age, Department) VALUES (1, 'John Doe', 30, 'HR')
INSERT INTO Employee (Id, Name, Age, Department) VALUES (2, 'Jane Smith', 25, 'Marketing')

-- Insert multiple rows at once
INSERT INTO Employee (Id, Name, Age, Department) VALUES 
(3, 'Alice Johnson', 28, 'Finance'),
(4, 'Bob Brown', 35, 'IT'),
(5, 'Charlie Davis', 22, 'Sales')

SELECT * FROM Employee

-- Update data in the Employee table
UPDATE Employee SET Age = 31 WHERE Id = 1
UPDATE Employee SET Department = 'Human Resources' WHERE Age >= 30
SELECT * FROM Employee

-- Delete data from the Employee table
DELETE FROM Employee WHERE Id = 5
DELETE FROM Employee WHERE Department = 'Marketing'
SELECT * FROM Employee