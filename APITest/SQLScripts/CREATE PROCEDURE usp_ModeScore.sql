USE master
USE DBTest

IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_ModusScore'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_ModusScore
GO
CREATE PROCEDURE dbo.usp_ModusScore
AS  SELECT T.Classname, MAX(T.Score) AS SCORE FROM
    (SELECT TOP 10 [Classname], [Score], COUNT(1) [Frequency]
    FROM   [CLASS_SCORE]
    GROUP  BY [Classname], [Score]
    ORDER  BY COUNT(1) DESC) AS T
    WHERE T.Frequency > 1 OR(T.Frequency = 1 AND T.Score = Score)
    GROUP BY Classname
    ORDER BY Classname ASC
GO
-- EXECUTE dbo.usp_ModusScore
-- GO