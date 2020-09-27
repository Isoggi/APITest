USE master
USE DBTest

IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_AverageScore'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_AverageScore
GO
CREATE PROCEDURE dbo.usp_AverageScore
AS
    SELECT Classname, AVG(Score) as Score 
    FROM CLASS_SCORE 
    GROUP BY Classname
GO
-- EXECUTE dbo.usp_AverageScore
-- GO