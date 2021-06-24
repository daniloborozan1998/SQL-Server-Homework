-- Homework requirement2/2

-- Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId in the following format:
	--StudentCardNumber without “sc-”
	--“ – “
	--First character  of student  FirstName
	--“.”
	--Student LastName

CREATE FUNCTION dbo.fn_FormatStudentName (@StudentId int)
RETURNS NVARCHAR(100)
AS
BEGIN

DECLARE @Output NVARCHAR(100)

SELECT @Output = RIGHT(StudentCardNumber,3) + N'-' + LEFT(FirstName,1) + N'.' + LastName
FROM Student
WHERE ID = @StudentId
RETURN @Output
END
GO

SELECT *, dbo.fn_FormatStudentName(ID) AS FUNCTIONOUTPUT
FROM Student