CREATE PROCEDURE [dbo].[NumberOfLessons]
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT Number
		FROM General G
		INNER JOIN People P ON P.[ID_Human]=G.[Professor]
		INNER JOIN (SELECT Professor, [Day], count(*) as Number
			FROM General G
			GROUP BY Professor, [Day]) GP ON GP.[Professor]=P.[ID_Human]
		WHERE Number>3)
	BEGIN
		PRINT('YES')
	END
	ELSE
	BEGIN
		PRINT('NO')
	END
END
GO