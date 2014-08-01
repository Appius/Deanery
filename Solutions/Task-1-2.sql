CREATE PROCEDURE [dbo].[List1]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT P.[LastName],P.[FirstName],P.[MiddleName]
	FROM Depart_profess DP
	INNER JOIN People P ON P.[ID_Human]=DP.[Professor]
	INNER JOIN Positions Pos ON Pos.[ID_Position]=DP.[Position]  
	WHERE DP.[Position]!=P.[Rank]
END
GO