CREATE PROCEDURE [dbo].[Dep_prof_subj]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT P.[LastName], P.[FirstName], P.[MiddleName], S.[Name] AS [Subject], D.[Name] AS Department
	FROM General G
	INNER JOIN (People P INNER JOIN Departments D ON P.[Departament]=D.[ID_Department]) ON P.[ID_Human]=G.[Professor]
	INNER JOIN Subjects S ON S.[ID_Subject]=G.[Subject]
END
GO