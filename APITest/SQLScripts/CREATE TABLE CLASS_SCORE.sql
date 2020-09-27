USE master
USE DBTest
IF OBJECT_ID('[dbo].[CLASS_SCORE]', 'U') IS NOT NULL
DROP TABLE [dbo].[CLASS_SCORE]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[CLASS_SCORE]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Classname] NVARCHAR(50) NOT NULL,
    [Score] INT NOT NULL,
    [Status] NVARCHAR(50) NOT NULL,
    [Created] DATETIME NOT NULL
    
    -- Specify more columns here
);
GO
-- Insert rows into table 'CLASS_SCORE' in schema '[dbo]'
INSERT INTO [dbo].[CLASS_SCORE]
( -- Columns to insert data into
 [Id], [Classname], [Score], [Status], [Created]
)
VALUES
(
    1, 'Class A', 80, 'Active',02-20-2020
),
(
    2, 'Class B', 90, 'Passive',02-20-2020
),
(
    3, 'Class A', 85, 'Passive',02-20-2020
),
(
    4, 'Class A', 75, 'Passive',02-20-2020
),
(
    5, 'Class C', 75, 'Active',02-21-2020
),
(
    6,'Class A',65,'Passive',02-21-2020
),
(
    7,'Class C',85,'Active',02-22-2020
),
( 
    8, 'Class B', 90, 'Active', 02-22-2020
),
(
    9, 'Class B', 75, 'Active', 02-22-2020)
GO


















