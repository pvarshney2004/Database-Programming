-- INDEX IN SQL SERVER
CREATE DATABASE Company;
USE Company

-- CREATING TABLE WITH DUMMY DATA
CREATE TABLE Employees
(
 Id INT,
 Name VARCHAR(50),
 Salary INT,
 Gender VARCHAR(10),
 City VARCHAR(50),
 Dept VARCHAR(50)
)
GO
INSERT INTO Employees VALUES (3,'Pranaya', 4500, 'Male', 'New York', 'IT')
INSERT INTO Employees VALUES (1,'Anurag', 2500, 'Male', 'London', 'IT')
INSERT INTO Employees VALUES (4,'Priyanka', 5500, 'Female', 'Tokiyo', 'HR')
INSERT INTO Employees VALUES (5,'Sambit', 3000, 'Male', 'Toronto', 'IT')
INSERT INTO Employees VALUES (7,'Preety', 6500, 'Female', 'Mumbai', 'HR')
INSERT INTO Employees VALUES (6,'Tarun', 4000, 'Male', 'Delhi', 'IT')
INSERT INTO Employees VALUES (2,'Hina', 500, 'Female', 'Sydney', 'HR')
INSERT INTO Employees VALUES (8,'John', 6500, 'Male', 'Mumbai', 'HR')
INSERT INTO Employees VALUES (10,'Pam', 4000, 'Female', 'Delhi', 'IT')
INSERT INTO Employees VALUES (9,'Sara', 500, 'Female', 'London', 'IT')

-- Table scan example
SELECT * FROM Employees WHERE Id=8; -- TABLE SCAN (NOT RECOMMENDED IN LARGE DATASETS)

-- Index scan example

--CREATING clustered INDEX ON ID COLUMN
CREATE CLUSTERED INDEX IX_Employee_ID ON Employees(Id ASC);
SELECT * FROM Employees WHERE Id=8; -- NOW ITS INDEX SCAN

sp_helpindex Employees -- command to check the indexes on the table
--DROP INDEX IX_Employee_ID ON Employees --command to drop the index

SELECT * FROM Employees

CREATE TABLE Trainee
(
 Id INT,
 Name VARCHAR(50),
 Salary INT,
 Gender VARCHAR(10),
 City VARCHAR(50),
 Dept VARCHAR(50)
)
GO

INSERT INTO Trainee VALUES (3,'Pranaya', 4500, 'Male', 'New York', 'IT')
INSERT INTO Trainee VALUES (1,'Anurag', 2500, 'Male', 'London', 'IT')
INSERT INTO Trainee VALUES (4,'Priyanka', 5500, 'Female', 'Tokiyo', 'HR')
INSERT INTO Trainee VALUES (5,'Sambit', 3000, 'Male', 'Toronto', 'IT')
INSERT INTO Trainee VALUES (7,'Preety', 6500, 'Female', 'Mumbai', 'HR')
INSERT INTO Trainee VALUES (6,'Tarun', 4000, 'Male', 'Delhi', 'IT')
INSERT INTO Trainee VALUES (2,'Hina', 500, 'Female', 'Sydney', 'HR')

SELECT * FROM Trainee -- GIVES DATA IN RANDOM ORDER NOT IN THE ORDER OF ID

--CREATING CLUSTERED INDEX ON ID COLUMN
CREATE CLUSTERED INDEX IX_Trainee_ID ON Trainee(Id ASC);
SELECT * FROM Trainee -- GIVES DATA IN THE ORDER OF ID

EXEC sp_spaceused Employees -- command to check the space used by the table

-- creating non clustered index on name column
CREATE NONCLUSTERED INDEX IX_Employee_Name ON Employees(Name ASC);
SELECT * FROM Employees WHERE Name='Pranaya' -- INDEX SEEK