--Homework requirement 1a/2


--Create new procedure called CreateGrade
--Procedure should create only Grade header info (not Grade Details) 
--Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade)
--Procedure should return second resultset with the MAX Grade of all grades for the Student and Teacher on input (regardless the Course)


ALTER PROCEDURE dbo.CreateGrade(@StudentId int, @CourseId int, @TeacherId int,@CreatedDate date, @Grade int)
AS
BEGIN
	INSERT INTO [dbo].[Grade] (StudentId, CourseId, TeacherId,CreatedDate,Grade)
	VALUES (@StudentId, @CourseId, @TeacherId, @CreatedDate,@Grade)

	SELECT COUNT(*) AS TotalGradesForStudents
	FROM [dbo].[Grade] G
	WHERE StudentID = @StudentId

	SELECT MAX(Grade) AS MAX_GRADE
	FROM [dbo].[Grade] G
	WHERE StudentID = @StudentId AND TeacherID = @TeacherId

END
GO

EXEC dbo.CreateGrade @StudentId=291, @CourseId=6,@TeacherId=85,@CreatedDate='1999-02-19',@Grade=7

SELECT *
FROM [dbo].[Grade]




