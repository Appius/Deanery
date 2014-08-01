CREATE PROCEDURE [dbo].[Schedule_for_prof]
	@Department nvarchar(10)
AS
BEGIN
	SET NOCOUNT ON;
		
	SELECT W.[NameOfDay] as [Day],NumberOfLesson,Gr.[Name] as [Group],P.[LastName],P.[FirstName],P.[MiddleName],S.[Name] as [Subject]
	FROM General G
	INNER JOIN Subjects S ON G.[Subject]=S.[ID_Subject]
	INNER JOIN (People P INNER JOIN Departments D ON P.[Departament]=D.[ID_Department]) ON P.[ID_Human]=G.[Professor]
	INNER JOIN [Week] W ON W.ID_Day = G.[Day]
	INNER JOIN [Groups] Gr ON G.[Group]=Gr.[ID_Group]
	WHERE D.[Name]=@Department
END
GO