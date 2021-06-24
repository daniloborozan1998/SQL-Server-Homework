--HOMEWORK REQUIREMENT 1/3

--Calculate the count of all grades in the system

SELECT COUNT(Grade) as TOTAL 
FROM [dbo].[Grade]
GO

--Calculate the count of all grades per Teacher in the system

SELECT TeacherID, COUNT(Grade) as TOTAL
FROM [dbo].[Grade]
GROUP BY TeacherID
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)


SELECT TeacherID, COUNT(Grade) as TOTAL
FROM [dbo].[Grade]
WHERE StudentID < 100
GROUP BY TeacherID
GO

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system

SELECT TeacherID, MAX(Grade) as TOTAL, AVG(Grade) as AVERAGE
FROM [dbo].[Grade]
GROUP BY TeacherID
GO

