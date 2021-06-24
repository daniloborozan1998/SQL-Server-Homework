﻿-- Homework requirement 1/2

--Declare scalar variable for storing FirstName values
   --Assign value ‘Antonio’ to the FirstName variable
   --Find all Students  having FirstName  same as the variable

DECLARE @FirstName NVARCHAR(100)
SET @FirstName = 'Antonio'

SELECT *
FROM Student
WHERE FirstName = @FirstName

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
	--Fill the  table variable with all Female  students


DECLARE @StudentList TABLE
(StudentId int, FirstName NVARCHAR(100), DateOfBirth date);

INSERT INTO @StudentList
SELECT ID,FirstName,DateOfBirth
FROM Student
WHERE Gender = 'F'

SELECT *
FROM @StudentList
GO

--Declare temp table that will contain LastName and EnrolledDate columns
	--Fill the temp table with all Male students having First Name starting with ‘A’
	--Retrieve  the students  from the  table which last name  is with 7 characters

CREATE TABLE #StudentList
(LastName NVARCHAR(100), EnrolledDate date)

INSERT INTO #StudentList
SELECT LastName, EnrolledDate
FROM Student
WHERE FirstName LIKE 'A%'

SELECT *
FROM #StudentList
WHERE LEN(LastName) = 7

-- Find all teachers whose FirstName length is less than 5 and the first 3 characters of their FirstName  and LastNameare the same

CREATE TABLE #TeacherList
(FirstName NVARCHAR(100),LastName NVARCHAR(100))

INSERT INTO #TeacherList
SELECT FirstName, LastName
FROM Teacher
WHERE SUBSTRING(FirstName,1,3) = SUBSTRING(LastName,1,3) and LEN(FirstName) < 5