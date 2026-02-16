-- USER-DEFINED Functions - A user-defined function is a routine that accepts parameters, performs an 
-- action such as a complex calculation, and returns the result of that action as a value.

-- 1. Scalar value function - returns a single value (of any data type) and can be used wherever an expression of that data type is allowed.

CREATE FUNCTION SVF1 ( @no1 INT )
RETURNS INT
AS
BEGIN 
RETURN @no1 * @no1
END
-- CALLING THE FUNCTION
SELECT dbo.SVF1(5) AS Result

CREATE FUNCTION CalculateArea ( @radius FLOAT )
RETURNS FLOAT
AS
BEGIN
RETURN 3.14 * @radius * @radius
END
-- CALLING THE FUNCTION
SELECT dbo.CalculateArea(10) AS Area



-- 2. Inline table-valued function - the body of the function will have only a Single Select Statement prepared with the “RETURN” statement
CREATE TABLE Student
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  DOB DATETIME,
  Branch VARCHAR(50)
)
-- Populate the Student Table with test data
INSERT INTO Student VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 'CSE')
INSERT INTO Student VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 'CSE')
INSERT INTO Student VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 'ETC')
INSERT INTO Student VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 'ETC')
INSERT INTO Student VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 'CSE')

--Create a function that accepts student id as input and returns that student details from the table.
CREATE FUNCTION GetStudentDetails ( @studentID INT )
RETURNS TABLE
AS
RETURN (SELECT * FROM Student WHERE ID = @studentID)
-- CALLING THE FUNCTION
SELECT * FROM dbo.GetStudentDetails(3)


--Create a function that accepts BRANCH NAME as input and returns that student details from the table.
CREATE FUNCTION GetStudentDetailsByBranch ( @BranchName VARCHAR(20) )
RETURNS TABLE
AS
RETURN (SELECT * FROM Student WHERE Branch = @BranchName)
-- CALLING THE FUNCTION
SELECT * FROM dbo.GetStudentDetailsByBranch('CSE')



-- 3. Multi-statement table-valued function - the body of the function will have multiple statements and the “RETURN” statement will return a table variable.
-- Multi-statement Table Valued function:
CREATE FUNCTION MSTVF_GetEmployees()
RETURNS @Table Table (ID int, Name nvarchar(20), DOB Date)
AS
BEGIN
  INSERT INTO @Table
    SELECT ID, Name, Cast(DOB AS Date)
    FROM Employee
  Return
End
SELECT * FROM MSTVF_GetEmployees()