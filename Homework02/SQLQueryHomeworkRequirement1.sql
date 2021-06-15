SELECT *
FROM Student
GO

SELECT *
FROM Grade
GO

SELECT *
FROM GradeDetails
GO

SELECT *
FROM Teacher
GO

SELECT *
FROM Course
GO

SELECT *
FROM AchievementType
GO



--HOMEWORK REQUIREMENT 1/6


-- Find all Students with FirstName= Antonio

SELECT *
FROM Student
WHERE FirstName = 'Antonio'
GO
-- Find all Students with DateOfBirthgreater than ‘01.01.1999’

SELECT *
FROM Student
WHERE DateOfBirth > '1999.01.01'
GO
-- Find all Male students

SELECT *
FROM Student
WHERE Gender = 'M'
GO
-- Find all Students with LastName starting With ‘T’

SELECT *
FROM Student
WHERE LastName LIKE 'T%'
GO
-- Find all Students Enrolled in January/1998

SELECT *
FROM Student
WHERE EnrolledDate >= '1998.01.01' and EnrolledDate <= '1998.01.31'
GO
-- Find all Students with LastNamestarting With ‘J’ enrolled in January/1998

SELECT *
FROM Student
WHERE LastName LIKE 'J%' and EnrolledDate >= '1998.01.01' and EnrolledDate <= '1998.01.31' -- Тhere is no such student
GO




