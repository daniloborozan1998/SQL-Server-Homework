--Homework requirement 1b/2

/*
--Create new procedure called CreateGradeDetail
--Procedure should add details for specific Grade (new record for new AchievementTypeID, Points, MaxPoints, Date for specific Grade)
--Output from this procedure should be resultset with SUM of GradePoints calculated with formula 
AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade.
*/

/*
Create new procedure called CreateOrderDetail
Procedure should add details for specific order (new record for new Product/Quantity for specific order)
Procedure should take the single price for item from Product table (Price column)
When the order detail is inserted procedure should correct the TotalPrice column in the main table (dbo.order)
Output from this procedure should be resultset with order details in a form of pairs: ProductName and TotalPrice per product (Price*Quantity)
*/

ALTER  PROCEDURE dbo.CreateGradeDetail (@GradeId int, @AchievementTypeID int, @AchievementPointsId int,@AchievementMaxPoints int, @AchievementDate date)
AS
BEGIN

DECLARE @ParticipationRate decimal(5,5)
DECLARE @GradePoints decimal(5,5)

SELECT @ParticipationRate = ParticipationRate
FROM [dbo].[AchievementType]
WHERE ID = @AchievementTypeID

INSERT INTO [dbo].[GradeDetails] (GradeId, AchievementTypeID, AchievementPoints, AchievementMaxPoints,AchievementDate)
VALUES (@GradeId,@AchievementTypeID,@AchievementPointsId,@AchievementMaxPoints,@AchievementDate)

SET @GradePoints  = 
(
	SELECT SUM(AchievementPoints/AchievementMaxPoints*A.ParticipationRate)
	FROM [dbo].[GradeDetails] GD 
	INNER JOIN [dbo].[AchievementType] A ON A.ID = GD.AchievementTypeID
	WHERE GD.GradeID = @GradeId 
)

UPDATE G SET Grade = @GradePoints
FROM [dbo].[Grade] G
WHERE ID = @GradeId

SELECT A.Name, SUM(GD.AchievementPoints) AS POINTS, SUM(GD.AchievementPoints/GD.AchievementMaxPoints*A.ParticipationRate) AS TOTALPOINTS
FROM [dbo].[GradeDetails] GD
INNER JOIN [dbo].[AchievementType] A ON A.ID = GD.AchievementTypeID
WHERE GD.GradeID = @GradeId
GROUP BY A.Name

END
GO

EXEC dbo.CreateGradeDetail  @GradeId = 4,@AchievementTypeID=12,@AchievementPointsId=81,@AchievementMaxPoints=100,@AchievementDate = '1999-02-02'

SELECT *
FROM [dbo].[Grade]
WHERE ID=1
