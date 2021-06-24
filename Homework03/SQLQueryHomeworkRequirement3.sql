--Homework requirement 3/3

--Create new view (vv_StudentGrades) that will List all StudentIdsand count of Grades per student

DROP VIEW IF EXISTS vv_StudentGrades;
GO

CREATE VIEW vv_StudentGrades
AS
SELECT StudentID, COUNT(Grade) AS COUNTS
FROM [dbo].[Grade]
GROUP BY StudentID
GO

--Change the view to show Student First and Last Names instead of StudentID

ALTER VIEW vv_StudentGrades
AS
SELECT S.FirstName,S.LastName, COUNT(Grade) AS COUNTS
FROM [dbo].[Grade] G
INNER JOIN [dbo].[Student] S ON G.StudentID = S.ID
GROUP BY S.FirstName, S.LastName

--List all rows from view ordered by biggest Grade Count

SELECT *
FROM vv_StudentGrades
ORDER BY COUNTS DESC
GO

--Create new view (vv_StudentGradeDetails) that will List all Students (FirstName and LastName) and Count the courses he passed through the exam(Ispit)

CREATE VIEW vv_StudentGradeDetails
AS
SELECT S.FirstName + N' ' + S.LastName AS STUDENTSNAME, COUNT(C.Name) AS EXAM
FROM [dbo].[Grade] G
INNER JOIN [dbo].[Student] S ON G.StudentID = S.ID
INNER JOIN [dbo].[Course] C ON C.ID = G.CourseID
GROUP BY S.FirstName,S.LastName










