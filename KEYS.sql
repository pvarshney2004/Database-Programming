USE PracticeDB1
GO

-- 1. PRIMARY KEY

-- creating table with primary key
CREATE TABLE Branches 
( 
    Bcode INT PRIMARY KEY, 
    Bname VARCHAR(40), 
    Bloc  CHAR(40)
) 
INSERT INTO Branches VALUES (101,'ABC','UP')
INSERT INTO Branches VALUES (102,'XYZ','UK')
SELECT * FROM Branches

--gives error as we trying to enter same value in primary key but it should unique and not null
INSERT INTO Branches VALUES (102,'MNO','Punjab') 
INSERT INTO Branches VALUES (null,'MNO','Punjab') 

-- 2. COMPOSITE PRIMARY KEY
CREATE TABLE BranchDetails 
( 
    City  VARCHAR(40), 
    Bcode INT, 
    Bloc  VARCHAR(30), 
    PRIMARY KEY(City, Bcode) 
) 
DROP TABLE BranchDetails
Insert into BranchDetails (City, Bcode, Bloc) values('Mumbai', 10, 'Goregaon')
Insert into BranchDetails (City, Bcode, Bloc) values('Mumbai', 20, 'Malad')
SELECT * from BranchDetails
Insert into BranchDetails (City, Bcode, Bloc) values('Mumbai', 20, 'Malad') -- gives error because (City, Bcode) is already present

-- 3. FOREIGN KEY
CREATE TABLE Dept 
( 
    Dno   INT PRIMARY KEY, 
    Dname VARCHAR(30), 
    Dloc  CHAR(40) 
) 
GO
INSERT Dept VALUES (10, '.NET', 'HYD') 
INSERT Dept VALUES (20, 'JAVA', 'PUNE') 
INSERT Dept VALUES (30, 'PHP', 'DELHI') 
Go

Select * from Dept

CREATE TABLE Employee 
( 
    Eid    INT PRIMARY KEY, 
    Ename  VARCHAR(30), 
    Salary MONEY, 
    Dno    INT FOREIGN KEY REFERENCES Dept(Dno) 
) 
INSERT into Employee VALUES (101,'AA', 25000, 10) 
INSERT into Employee VALUES (102,'BB', 32000, 20) 
INSERT into Employee VALUES (103,'CC', 52000, 40) -- Not Allowed
Select * from Employee