-- =================================================
--   Populating the Company Database
-- =================================================

-- =================================================
-- Creating the 4 tables
-- -------------------------------------------------

CREATE TABLE Employees (EmpID int NOT NULL, FirstName varchar(255), LastName varchar(255), PRIMARY KEY(EmpID)); 
CREATE TABLE Clients (ClientID int NOT NULL, FirstName varchar(255), LastName varchar(255), CompanyName varchar(255), RelationshipManagerID int, PRIMARY KEY(ClientID));
CREATE TABLE Tasks (TaskID int NOT NULL, TaskName varchar(255), PRIMARY KEY(TaskID)); 
CREATE TABLE Prospects (ProspectID int NOT NULL, ProspectName varchar(255), AssignedEmployee int, TaskType int, DateCreated datetime, LastUpdated datetime, Status varchar(10), PRIMARY KEY(ProspectID)); 

-- =================================================
-- Inserting Values to populate the tables
-- -------------------------------------------------

INSERT INTO Employees (EmpID, FirstName, LastName) 
VALUES (1101, "Adrian", "Alvarez")
INSERT INTO Employees (EmpID, FirstName, LastName) 
VALUES (2202, "Brian", "Beach");
INSERT INTO Employees (EmpID, FirstName, LastName) 
VALUES (3303, "Catherine", "Cory");
INSERT INTO Employees (EmpID, FirstName, LastName) 
VALUES (4404, "Dominic", "D'Costa");
INSERT INTO Employees (EmpID, FirstName, LastName) 
VALUES (5505, "Emma", "Emery");

INSERT INTO Clients (ClientID, FirstName, LastName, CompanyName, RelationshipManagerID)
VALUES (10001, "John", "Jeremy", "J-Star", 1101); 
INSERT INTO Clients (ClientID, FirstName, LastName, CompanyName, RelationshipManagerID)
VALUES (10002, "Kurt", "Klein", NULL, 5505); 
INSERT INTO Clients (ClientID, FirstName, LastName, CompanyName, RelationshipManagerID)
VALUES (10003, "Logan", "Lovitz", "L-Company", 2202); 

INSERT INTO Tasks (TaskID, TaskName)
VALUES (500, "Accounting"); 
INSERT INTO Tasks (TaskID, TaskName)
VALUES (501, "Taxes"); 

INSERT INTO Prospects (ProspectID, ProspectName, AssignedEmployee, TaskType, DateCreated, LastUpdated, Status)
VALUES (15000, "Zenith Star", 3303, 501, date(), date(), "Cold");
INSERT INTO Prospects (ProspectID, ProspectName, AssignedEmployee, TaskType, DateCreated, LastUpdated, Status)
VALUES (15001, "Xylophone Music", 5505, 500, date(), date(), "Hot");
INSERT INTO Prospects (ProspectID, ProspectName, AssignedEmployee, TaskType, DateCreated, LastUpdated, Status)
VALUES (15002, "County Castle", 1101, 500, date(), date(), "Warm");
INSERT INTO Prospects (ProspectID, ProspectName, AssignedEmployee, TaskType, DateCreated, LastUpdated, Status)
VALUES (15003, "Mrs. Vera", 4404, 501, date(), date(), "Converted");
INSERT INTO Prospects (ProspectID, ProspectName, AssignedEmployee, TaskType, DateCreated, LastUpdated, Status)
VALUES (15004, "Technic Records", 5505, 501, date(), date(), "Hot");
INSERT INTO Prospects (ProspectID, ProspectName, AssignedEmployee, TaskType, DateCreated, LastUpdated, Status)
VALUES (15005, "Thomas School", 1101, 500, date(), date(), "Warm");
INSERT INTO Prospects (ProspectID, ProspectName, AssignedEmployee, TaskType, DateCreated, LastUpdated, Status)
VALUES (15006, "Mr. Wayne", 5505, 501, date(), date(), "Cold");
INSERT INTO Prospects (ProspectID, ProspectName, AssignedEmployee, TaskType, DateCreated, LastUpdated, Status)
VALUES (15007, "Mr. Fox", 4404, 501, date(), date(), "Cold");
INSERT INTO Prospects (ProspectID, ProspectName, AssignedEmployee, TaskType, DateCreated, LastUpdated, Status)
VALUES (15008, "Mr. Pennyworth", 5505, 500, date(), date(), "Cold");

-- =================================================
-- Viewing the tables
-- -------------------------------------------------

SELECT *
FROM Employees;
SELECT * 
FROM Clients;
SELECT * 
FROM Tasks;
SELECT *
FROM Prospects;