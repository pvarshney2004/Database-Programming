-- SQL Server Stored Procedure Encryption and Recompile Attribute

SELECT * FROM Employee

-- Stored Procedure without with encryption option
CREATE Procedure sp_GetEmployeeDetailsById
(
  @ID INT
)
AS
BEGIN
  SELECT  Name, Gender, CAST(DOB AS DATE) AS DOB 
  FROM   Employee 
  WHERE   ID = @ID
END


SELECT * FROM SYSCOMMENTS WHERE ID = OBJECT_ID('sp_GetEmployeeDetailsById')
sp_helptext sp_GetEmployeeDetailsById


-- Stored Procedure with encryption option
ALTER Procedure sp_GetEmployeeDetailsById
(
  @ID INT
)
WITH ENCRYPTION
AS
BEGIN
  SELECT Name, Gender, CAST(DOB AS DATE) AS DOB 
  FROM Employee 
  WHERE ID = @ID
END

SELECT * FROM SYSCOMMENTS WHERE ID = OBJECT_ID('sp_GetEmployeeDetailsById')
sp_helptext sp_GetEmployeeDetailsById


-- With Recompiled Attribute in SQL Server Stored Procedure
ALTER Procedure sp_GetEmployeeDetailsById
(
  @ID INT
)
WITH RECOMPILE
AS
BEGIN
  SELECT Name, Gender, CAST(DOB AS DATE) AS DOB 
  FROM Employee 
  WHERE ID = @ID
END