CREATE DATABASE PracticeDB2;
USE PracticeDB2;

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
--Inserting dummy data in Employee Table
INSERT INTO Employee VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 1)
INSERT INTO Employee VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 2)
INSERT INTO Employee VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 2)
INSERT INTO Employee VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 3)
INSERT INTO Employee VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 1)
INSERT INTO Employee VALUES(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 2)
GO

SELECT * FROM Employee

-- Create a stored procedure to get employee details (without parameter)
CREATE PROCEDURE sp_GetEmployee
AS
BEGIN
Select Name, Gender, DOB from Employee
END
-- Execute the stored procedure
EXEC sp_GetEmployee

-- Get the definition of the stored procedure
sp_helptext sp_GetEmployee

-- changing the stored procedure
ALTER PROCEDURE sp_GetEmployee
AS
BEGIN
Select Name, Gender, DOB from Employee
order by Name
END

-- renaming the stored procedure
EXEC sp_rename 'sp_GetEmployee', 'sp_GetEmployeeDetails'

-- Execute the stored procedure
EXEC sp_GetEmployeeDetails

-- Input parameter in stored procedure
CREATE PROCEDURE sp_AddTwoNumbers(@no1 INT, @no2 INT)
AS
BEGIN
  DECLARE @Result INT
  SET @Result = @no1 + @no2
  PRINT 'RESULT IS: '+ CAST(@Result AS VARCHAR)
END

EXECUTE sp_AddTwoNumbers 10, 80

CREATE PROCEDURE spGetEmployeesByGenderAndDepartment
  @Gender VARCHAR(20),
  @DeptID INT
AS
BEGIN
  SELECT Name, Gender, DOB, DeptID 
  FROM Employee
  WHERE Gender = @Gender AND DeptID = @DeptID
END

EXECUTE spGetEmployeesByGenderAndDepartment @Gender = 'Male', @DeptID =  1

-- procedure to update details in employee table based on emp id
CREATE PROCEDURE spUpdateEmployeeDetails
  @ID INT,
  @Name VARCHAR(50),
  @Gender VARCHAR(50),
  @DOB DATETIME,
  @DeptID INT
AS
BEGIN
  UPDATE Employee
  SET Name = @Name,
  Gender = @Gender,
  DOB = @DOB,
  DeptID = @DeptID
  WHERE ID = @ID
END

EXECUTE spUpdateEmployeeDetails 3, 'Palak', 'Female', '1994-06-17 10:53:27.060', 3


-- Output parameter in stored procedure
CREATE PROCEDURE spGetResult
  @No1 INT,
  @No2 INT,
  @Result INT OUTPUT
AS
BEGIN
  SET @Result = @No1 + @No2
END

DECLARE @Result INT
EXECUTE spGetResult 10, 20, @Result OUT
PRINT 'Result is: '+ cast(@Result AS VARCHAR)

-- another example of output parameter
CREATE PROCEDURE spGetEmployeeCountByGender
  @Gender VARCHAR(30),
  @EmployeeCount INT OUTPUT
AS
BEGIN
  SELECT @EmployeeCount = COUNT(ID)
  FROM    Employee
  WHERE  Gender = @Gender
END

DECLARE @EmployeeTotal INT
EXECUTE spGetEmployeeCountByGender 'Male', @EmployeeTotal OUTPUT
PRINT @EmployeeTotal

-- stored procedure with default value
CREATE PROCEDURE spAddNumber(@No1 INT= 100, @No2 INT)
AS
BEGIN
  DECLARE @Result INT
  SET @Result = @No1 + @No2
  PRINT 'The SUM of the 2 Numbers is: '+ CAST(@Result AS VARCHAR)
END

EXECUTE spAddNumber @No2 = 50
EXECUTE spAddNumber @No1 = 20, @No2 = 30
EXEC spAddNumber @No1=DEFAULT, @No2=25
EXEC spAddNumber 23,12
--EXEC spAddNumber 23 -- not possible

SELECT * FROM Employee


-- STORED PROCEDURE WITH RETURN VALUE
CREATE PROCEDURE spGetTotalCountOfEmployee1
  @TotalCount INT OUTPUT
AS
BEGIN
  SELECT @TotalCount =COUNT(ID)FROM Employee
END
DECLARE @TotalCount INT
EXECUTE spGetTotalCountOfEmployee1 @TotalCount OUTPUT
PRINT 'Total Count of Employee is: '+ CAST(@TotalCount AS VARCHAR)



CREATE PROCEDURE spGetTotalCountOfEmployee2
AS
BEGIN
  RETURN (SELECT COUNT(ID) FROM Employee)
END
-- For calling the procedure:
DECLARE @EmployeeTotal INT
EXECUTE @EmployeeTotal = spGetTotalCountOfEmployee2
PRINT @EmployeeTotal



CREATE PROCEDURE spGetEmplloyeeNameById1
  @ID INT,
  @Name VARCHAR(30) OUTPUT
AS
BEGIN
  SELECT @Name = Name FROM Employee WHERE ID = @ID
END
GO
-- For calling the procedure:
DECLARE @EmployeeName VARCHAR(30)
EXECUTE spGetEmplloyeeNameById1 3, @EmployeeName OUTPUT
PRINT @EmployeeName


-- when we want to see the dependency object of a stored procedure
sp_depends Employee
sp_depends sp_GetEmployeeDetails

sp_helptext sp_GetEmployeeDetails