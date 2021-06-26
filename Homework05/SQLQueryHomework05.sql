--Homework requirement 1/1

--Create multi-statement table value function that for specific Teacher and Course will return list of students (FirstName, LastName) who passed the exam, together with Grade and CreatedDate

DROP FUNCTION IF EXISTS dbo.fn_CoursePerTeacher;
GO

CREATE FUNCTION dbo.fn_CoursePerTeacher (@TeacherId int, @CourseId int)
RETURNS @Results	TABLE (FirstName nvarchar(100),LastName nvarchar(100), Grade int, CreatedDate datetime)
AS
BEGIN

INSERT INTO @Results
SELECT S.FirstName AS StudentFirstName, S.LastName AS StudentLastName,G.Grade AS GRADE,G.CreatedDate AS CreatedDate
FROM [dbo].[Grade] G
INNER JOIN [dbo].[Student] S ON S.ID = G.StudentID
INNER JOIN [dbo].[Course] C ON C.ID = G.CourseID
INNER JOIN [dbo].[GradeDetails] GD ON G.ID = GD.GradeID
INNER JOIN [dbo].[AchievementType] A ON A.ID = GD.AchievementTypeID
WHERE A.Name = 'ispit' and GD.AchievementPoints > 50 and  G.TeacherID = @TeacherId AND G.CourseID = @CourseId
GROUP BY S.FirstName,S.LastName, G.Grade, G.CreatedDate


RETURN
END

GO

DECLARE @TeacherId int = 1
DECLARE @CourseId int = 1

SELECT *
FROM dbo.fn_CoursePerTeacher (@TeacherId,@CourseId)