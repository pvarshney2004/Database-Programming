-- CREATING A DEMO DATABASE AND TABLES
CREATE DATABASE DEMO
USE DEMO

-- DEFAULT CONSTRAINT EXAMPLE
CREATE TABLE Employee (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Mumbai',
    DateOfBirth date DEFAULT GETDATE(),
    Salary   DECIMAL (18, 2) DEFAULT 5000.00
)
Insert into Employee (ID, LastName, Age) values(1, 'Rout', 30)
Select * from Employee

-- NOT NULL CONSTRAINT EXAMPLE
CREATE TABLE customer 
( 
    id    INT NOT NULL, 
    name  VARCHAR(30) NOT NULL, 
    mobno CHAR(10) NOT NULL 
) 
INSERT customer VALUES (101, 'AA', '1111111111')
INSERT customer VALUES (101, 'AA', '2222222222')
INSERT customer VALUES (NULL, NULL, NULL)--GIVES ERROR
SELECT * FROM customer

-- UNIQUE CONSTRAINT EXAMPLE
CREATE TABLE Trainee
( 
    Id      INT UNIQUE, 
    NAME    VARCHAR(30) UNIQUE, 
    Emailid VARCHAR(100) UNIQUE 
) 
INSERT Trainee VALUES (10,  'Abc',  'abc@gmail.com')
INSERT Trainee VALUES (10,  'Abc',  'abc@gmail.com') -- gives error
select * from Trainee

-- Composite CONSTRAINT EXAMPLE
CREATE TABLE BranchDetails 
( 
    City           VARCHAR(50), 
    Branchcode     VARCHAR(10), 
    Branchlocation VARCHAR (30), 
    CONSTRAINT city_bc_unique UNIQUE(City, Branchcode) 
)
Insert into BranchDetails (City, Branchcode, Branchlocation) values('Mumbai', 'xyz','abc') 
Insert into BranchDetails (City, Branchcode, Branchlocation) values('Mumbai', 'abc','pqr') 
Insert into BranchDetails (City, Branchcode, Branchlocation) values('Mumbai', 'xyz','pqr') -- gives error because of duplicate city and branchcode combination
Select * from BranchDetails

-- CHECK CONSTRAINT EXAMPLE
CREATE TABLE Student 
( 
    Id      INT, 
    Name    VARCHAR(30), 
    Age     INT, 
    CONSTRAINT chk_age CHECK (Age >= 18) 
)
INSERT INTO Student VALUES (1, 'Abc', 20)
INSERT INTO Student VALUES (2, 'Pqr', 18) 
INSERT INTO Student VALUES (2, 'Pqr', 17) -- gives error because of age less than 18
SELECT * FROM Student