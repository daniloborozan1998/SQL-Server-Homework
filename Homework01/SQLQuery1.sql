CREATE TABLE [dbo].[Student](
[Id] [int] IDENTITY(1,1) NOT NULL,
[FirstName] [nvarchar](50) NULL,
[LastName] [nvarchar](50) NULL,
[DateOfBirth] [date] NULL,
[EnrolledDate] [date] NULL,
[Gender] [nchar](1) NULL,
[NationalIDNumber] [int],
[StudentCardNumber] [int],
PRIMARY KEY ([Id])
)

CREATE TABLE [dbo].[Teacher](
[Id] [int] IDENTITY(1,1) NOT NULL,
[FirstName] [nvarchar](50) NULL,
[LastName] [nvarchar](50) NULL,
[DateOfBirth] [date] NULL,
[AcademicRank] [nvarchar](50) NULL,
[HireDate] [date] NULL,
PRIMARY KEY ([Id])
)

CREATE TABLE [dbo].[GradeDetails](
[Id] [int] IDENTITY(1,1) NOT NULL,
[GradeID] [int] ,
[AchievementTypeID] [int],
[AchievementPoints] [int],
[AchievementMaxPoints] [int],
[AchievementDate] [date] NULL,
PRIMARY KEY ([Id])
)

CREATE TABLE [dbo].[Course](
[Id] [int] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar](50) NULL,
[Credit] [int],
[AcademicYear] [date] NULL,
[Semester] [int],
PRIMARY KEY ([Id])
)

CREATE TABLE [dbo].[Grade](
[Id] [int] IDENTITY(1,1) NOT NULL,
[StudentID] [int] ,
[CourseID] [int],
[TeacherID] [int],
[Grade] [int],
[Comment] [nvarchar](50) NULL,
[CreatedDate] [date] NULL,
PRIMARY KEY ([Id])
)

CREATE TABLE [dbo].[AchievementType](
[Id] [int] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar](50) NULL,
[Description] [nvarchar](50) NULL,
[ParticipationRate] [decimal](5,5),
PRIMARY KEY ([Id])
)