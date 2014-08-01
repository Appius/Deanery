CREATE PROCEDURE [dbo].[Correct]
	@LastName nvarchar(50),
	@FirstName nvarchar(50),
	@Day nvarchar(50),
	@NumberOfLesson int,
	@Group nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Prof_ID INT
	SET @Prof_ID=(SELECT ID_Human FROM [People] WHERE LastName=@LastName AND FirstName=@FirstName)
	
	DECLARE @GROUP_ID INT
	SET @GROUP_ID=(SELECT ID_Group FROM [Groups] WHERE Name=@Group)
	
	DECLARE @DAY_ID INT
	SET @DAY_ID=(SELECT ID_Day FROM [Week] WHERE NameOfDay=@Day)
	
	UPDATE General
	SET [Day]=@Day, [NumberOfLesson]=@NumberOfLesson, [Professor]=@Prof_ID
	WHERE [Group]=@Group
END
GO