CREATE PROCEDURE [dbo].[Quality]
	@Department nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Dep_ID INT
	SET @Dep_ID=(SELECT ID_Department FROM [Departments] WHERE Name=@Department)

	SELECT R.[Name], COUNT(*)
	FROM People P
	INNER JOIN Ranks R ON P.[Rank]=R.[ID_Rank]
	WHERE P.[Departament]=@Dep_ID
	GROUP BY P.[Rank], R.[Name]
END
GO