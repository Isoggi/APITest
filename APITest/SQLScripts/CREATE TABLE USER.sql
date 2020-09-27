USE master
Use DBTest
IF OBJECT_ID('[dbo].[USER]', 'U') IS NOT NULL
DROP TABLE [dbo].[USER]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[USER]
(
    [Id] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Username] NVARCHAR(50) NOT NULL,
    [Password] NVARCHAR(50) NOT NULL,
    [Age] INT NOT NULL
    -- Specify more columns here
);
GO

-- Insert rows into table 'USER' in schema '[dbo]'
INSERT INTO [dbo].[USER]
( -- Columns to insert data into
 [Id],[Username], [Password], [Age]
)
VALUES
( -- First row: values for the columns in the list above
 1,'admin@admin.com', '43bdd84a5296ab68dbadfd1de32d4aa8', 18
)
-- Add more rows here
GO