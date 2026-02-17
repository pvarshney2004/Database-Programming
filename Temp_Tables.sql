-- Temp Tables - Temporary tables are used to store intermediate results temporarily. 
--They are created in the tempdb database and are automatically dropped when they go out of scope. 
--There are two types of temporary tables: local temporary tables (prefixed with #) and global temporary 
--tables (prefixed with ##). Local temporary tables are visible only to the session that created them, 
--while global temporary tables are visible to all sessions.

-- creating a temporary table to store employee details
CREATE TABLE #EmpDetails (id INT, name VARCHAR(25))  
INSERT INTO #EmpDetails VALUES (01, 'James'), (02, 'Mike') 
SELECT * FROM #EmpDetails 

-- types of temporary tables
-- 1. Local Temporary Table - created using single # prefix, visible only to the session that created it, 
-- automatically dropped when the session ends.

CREATE PROCEDURE ProcTemp 
AS
BEGIN
	CREATE TABLE #TempTable (id INT, name VARCHAR(25))
	INSERT INTO #TempTable VALUES (01, 'James'), (02, 'Mike')
	SELECT * FROM #TempTable
END

EXECUTE ProcTemp 

-- 2. Global Temporary Table - created using double ## prefix, visible to all sessions, automatically 
-- dropped when the last session referencing it ends.

CREATE TABLE ##EmpDetails (id INT, name VARCHAR(25)) 