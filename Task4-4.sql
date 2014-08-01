ALTER PROCEDURE [dbo].[LastList]
	@Department nvarchar(10),
	@LastName nvarchar(50),
	@FirstName nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @ID_Human INT
	SET @ID_Human=(SELECT ID_Human FROM People WHERE FirstName=@FirstName AND LastName=@LastName AND Departament=(SELECT ID_Department FROM Departments WHERE Name=@Department))

	SELECT S.[Name] as [Subject], count(*) as NumberOfLessons
	FROM General G
	INNER JOIN Subjects S ON S.[ID_Subject]=G.[Subject]
	WHERE G.[Professor]=@ID_Human
	GROUP BY S.[Name]

	DECLARE @COUNT INT
	SET @COUNT=(SELECT COUNT(*) FROM 
	(SELECT S.[Name] as [Subject], count(*) as NumberOfLessons
	FROM General G
	INNER JOIN Subjects S ON S.[ID_Subject]=G.[Subject]
	WHERE G.[Professor]=@ID_Human
	GROUP BY S.[Name]) P)

	PRINT(@COUNT)
END
GO