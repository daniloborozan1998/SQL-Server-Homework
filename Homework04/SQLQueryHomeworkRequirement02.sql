-- Homework requirement 2/2

-- Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId in the following format:
	--StudentCardNumber without “sc-”
	--“ – “
	--First character  of student  FirstName
	--“.”
	--Student LastName

CREATE FUNCTION dbo.fn_FormatStudentNames (@StudentId int)
RETURNS NVARCHAR(100)
AS
BEGIN

DECLARE @Results NVARCHAR(100)

SELECT @Results = RIGHT(StudentCardNumber,5) + N'-' + LEFT(FirstName,1) + N'.' + LastName
FROM Student
WHERE ID = @StudentId
RETURN @Results
END
GO

SELECT *, dbo.fn_FormatStudentNames (ID) AS FUNCTIONOUTPUT
FROM Student

