CREATE PROCEDURE [dbo].[Schedule]
	@Group nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Group_ID INT
	SET @Group_ID=(SELECT ID_Group FROM [Groups] WHERE Name=@Group)

	SELECT P.[LastName],P.[FirstName],P.[MiddleName],W.[NameOfDay],NumberOfLesson,S.[Name]
	FROM General G
	INNER JOIN People P ON P.[ID_Human]=G.[Professor]
	INNER JOIN Subjects S ON S.[ID_Subject]=G.[Subject]
	INNER JOIN [Week] W ON W.[ID_Day]=G.[Day]
	WHERE G.[Group]=@Group_ID
END
GO