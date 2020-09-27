-- Create a new stored procedure called 'usp_AVGMODESCORE' in schema 'dbo'
-- Drop the stored procedure if it already exists
USE master
USE DBTest

IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_AVGMODESCORE'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_AVGMODESCORE
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_AVGMODESCORE
AS
    -- body of the stored procedure
    SELECT A.Classname, A.Created, A.AvgScore, B.ModeScore
    FROM (SELECT Classname, Created, AVG(SCORE) AS AvgScore FROM CLASS_SCORE GROUP BY Classname, Created) AS A
    JOIN (SELECT TOP 100 T.Classname, T.Created, MAX(T.Score) AS ModeScore FROM
            (SELECT TOP 100 [Classname], [Created], [Score], COUNT(1) [Frequency]
                FROM   [CLASS_SCORE]
                GROUP  BY [Classname], [Created], [Score]
                ORDER  BY COUNT(1) DESC) AS T
        WHERE T.Frequency > 1 OR(T.Frequency = 1 AND T.Score = Score)
        GROUP BY T.Classname, T.Created
        ORDER BY T.Classname ASC) AS B ON B.Classname = A.Classname AND B.Created = A.Created
        ORDER BY A.ClassName, A.Created
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.usp_AVGMODESCORE
GO