-- Encryption and Schema Binding Option in SQL Server Functions

-- WITH ENCRYPTION OPTION in SQL Server User-Defined Function:
-- The WITH ENCRYPTION option is used to encrypt the definition of a user-defined function in SQL Server. 
-- When this option is specified, the function's definition is obfuscated and cannot be viewed using standard 
-- methods such as sp_helptext or querying the sys.sql_modules catalog view. This can help protect the intellectual 
-- property of the function's logic and prevent unauthorized access to its code.

SELECT * FROM Employee

-- Function with encryption option
CREATE FUNCTION fn_GetEmployeeDetailsById
(
  @ID INT
)
RETURNS TABLE
WITH Encryption
AS
RETURN (SELECT Name, Gender, CAST(DOB AS DATE) AS DOB 
    FROM Employee 
    WHERE ID = @ID)

sp_helptext fn_GetEmployeeDetailsById


-- WITH SCHEMA BINDING OPTION in SQL Server User-Defined Function:
-- The SCHEMABINDING option specifies that the function is bound to the database objects that it 
-- references. So, when the SCHEMABINDING option is specified the database object cannot be modified 
-- in any way that would affect the function definition.

-- Function with SCHEMABINDING option
CREATE FUNCTION fn_GetEmployeesByGender
(
  @Gender INT
)
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN (SELECT Name, Gender, CAST(DOB AS DATE) AS DOB 
    FROM dbo.Employee 
    WHERE Gender = @Gender)

DROP TABLE Employee -- not allowed because of schema binding