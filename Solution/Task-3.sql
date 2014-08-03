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
	BEGIN TRY
		SET @Prof_ID=(SELECT ID_Human FROM [People] WHERE LastName=@LastName AND FirstName=@FirstName)
	END TRY
	BEGIN CATCH
		PRINT 'First name or last name strings is invalid. Please check and try again.'
		THROW;
	END CATCH

	DECLARE @GROUP_ID INT
	BEGIN TRY
		SET @GROUP_ID=(SELECT ID_Group FROM [Groups] WHERE Name=@Group)
	END TRY
	BEGIN CATCH
		PRINT 'Group string is invalid. Please check and try again.'
		THROW;
	END CATCH

	DECLARE @DAY_ID INT
	BEGIN TRY
		SET @DAY_ID=(SELECT ID_Day FROM [Week] WHERE NameOfDay=@Day)
	END TRY
	BEGIN CATCH
		PRINT 'Day string is invalid. Please check and try again.'
		THROW;
	END CATCH

	UPDATE General
	SET [Day]=@Day, [NumberOfLesson]=@NumberOfLesson, [Professor]=@Prof_ID
	WHERE [Group]=@Group
END
GO