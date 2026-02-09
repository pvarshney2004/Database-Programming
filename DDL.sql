-- DDL Commands in SQL Server: CREATE, ALTER, DROP, TRUNCATE

-- using CREATE command to create a new database named PracticeDB
CREATE DATABASE PracticeDB

-- using ALTER command to change the name of the database from PracticeDB to PraciceDB1
ALTER DATABASE PracticeDB MODIFY NAME = PracticeDB1
USE PracticeDB1

--using CREATE command to create a new table named Employee in PracticeDB1 database
CREATE TABLE Employee (
	ID int,
	LastName varchar(255),
	FirstName varchar(255),
	Age int
)
INSERT INTO Employee (ID, LastName, FirstName, Age) VALUES (1, 'Rout', 'Satyarth', 30)
INSERT INTO Employee (ID, LastName, FirstName, Age) VALUES (2, 'Smith', 'John', 25)
SELECT * FROM Employee -- SELECT is a DQL command to retrieve data from the Employee table

-- using ALTER to add a new column named Address to the Employee table
ALTER TABLE Employee ADD Address varchar(255)

-- using ALTER-DROP command to delete the Address column from the Employee table
ALTER TABLE Employee DROP COLUMN Address

-- using TRUNCATE command to delete all the records from the Employee table
TRUNCATE TABLE Employee
SELECT * FROM Employee -- gives empty result set because all records have been deleted from the Employee table

-- using DROP command for table
DROP TABLE Employee

-- using DROP command to delete the database PracticeDB1 by first switching to the master database and then dropping the PracticeDB1 database
use master
DROP DATABASE PracticeDB1