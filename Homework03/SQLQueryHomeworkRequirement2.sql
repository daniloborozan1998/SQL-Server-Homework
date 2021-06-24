--Homework requirement2/3

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

SELECT TeacherID, SUM(Grade) as TOTAL
FROM [dbo].[Grade]
GROUP BY TeacherID
HAVING COUNT(Grade) > 200
GO


--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100) and filter teachers with more than 50 Grade count

SELECT TeacherID, SUM(Grade) as TOTAL
FROM [dbo].[Grade]
WHERE StudentID < 100
GROUP BY TeacherID
HAVING COUNT(Grade) > 50
GO

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade

SELECT StudentID,COUNT(Grade) as COUNTS, MAX(Grade) as TOTAL, AVG(Grade) as AVERAGE
FROM [dbo].[Grade]
GROUP BY StudentID
HAVING MAX(Grade) = AVG(Grade)
GO

--List Student First Name and Last Name next to the other details from previous query

SELECT StudentID, S.FirstName AS STUDENTFIRSTNAME, S.LastName AS STUDENTLASTNAME, COUNT(Grade) as COUNTS, MAX(Grade) as TOTAL, AVG(Grade) as AVERAGE
FROM [dbo].[Grade] G
INNER JOIN [dbo].[Student] S ON S.ID = G.StudentID
GROUP BY StudentID,S.FirstName,S.LastName
HAVING MAX(Grade) = AVG(Grade)
GO


