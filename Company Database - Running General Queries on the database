-- =================================================
--   Company Database General Queries
-- =================================================

-- The database used for these set of questions 
-- contains the following 4 tables: 
--
-- Employess ( EmpID, FirstName, LastName )
-- Clients ( ClientID, FirstName, LastName, 
--          CompanyName, RelationshipManagerID )
-- Tasks ( TaskID, TaskName )
-- Prospects ( ProspectID, ProspectName, 
--             AssignedEmployee, TaskType, 
--             DateCreated, LastUpdated, Status )

-- =================================================
-- Find all prospects being managed by a certain
-- employee based on their name
-- -------------------------------------------------

SELECT P.ProspectName as "Prospect", E.FirstName as "First Name", E.LastName as "Last Name"
FROM Prospects as P JOIN Employees as E ON P.AssignedEmployee = E.EmpID
WHERE ( SELECT EmpID
        FROM Employees 
        WHERE FirstName = "Emma" and LastName = "Emery") = E.EmpID
ORDER BY E.FirstName;

-- =================================================
-- Find the number of prospects for different levels 
-- of status for each employee that handles atleast 
-- one prospect
-- -------------------------------------------------

SELECT E.FirstName as "First Name", E.LastName as "Last Name", P.Status as "Status", COUNT(*) as "Count"
FROM Employees as E JOIN Prospects as P ON E.EmpID = P.AssignedEmployee
GROUP BY E.EmpID, P.Status; 

-- =================================================
-- Find the number of prospects each employee has 
-- worked on in the last week 
-- -------------------------------------------------

SELECT E.FirstName as "First Name", E.LastName as "Last Name", COUNT(*) as "Count"
FROM Employees as E JOIN Prospects as P ON E.EmpID = P.AssignedEmployee
WHERE P.LastUpdated >= DATETIME("now", "-7 day") 
GROUP BY E.EmpID; 

-- =================================================
-- Find all active (not Cold) prospects and also 
-- note the tasks that are assigned to them
-- -------------------------------------------------

SELECT P.ProspectName as "Prospect", E.FirstName as "First Name", E.LastName as "Last Name", T.TaskName as "Task"
FROM Prospects as P JOIN Employees as E JOIN Tasks as T ON E.EmpID = P.AssignedEmployee AND T.TaskID = P.TaskType
WHERE P.Status IS NOT "Cold"; 

-- =================================================
-- Find the total number of clients each employee 
-- is in charge of 
-- -------------------------------------------------

SELECT E.FirstName as "First Name", E.LastName as "Last Name", COUNT(*) as "Count"
FROM Employees as E JOIN Clients as C ON E.EmpID = C.RelationshipManagerID
GROUP BY E.EmpID; 
