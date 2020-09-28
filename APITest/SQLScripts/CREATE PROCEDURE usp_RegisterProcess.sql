-- Create a new stored procedure called 'usp_RegisterProcess' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_RegisterProcess'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_RegisterProcess
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_RegisterProcess
    @username /*parameter name*/ NVARCHAR(50) /*datatype_for_param1*/ = '', /*default_value_for_param1*/
    @password /*parameter name*/ NVARCHAR(50) /*datatype_for_param2*/ = '', /*default_value_for_param2*/
    @age /*parameter name*/ INT /*datatype_for_param3*/ = '' /*default_value_for_param3*/
-- add more stored procedure parameters here
AS
    DECLARE @_USERNAME NVARCHAR(50);
    SET @_USERNAME = '';
    DECLARE @_PASSWORD NVARCHAR(50);
    SET @_PASSWORD = '';
    DECLARE @_AGE INT;
    SET @_AGE = 0;
    DECLARE @LAST_ID INT;
    SET @LAST_ID = (SELECT TOP 1 MAX(Id) FROM [dbo].[USER]);
    DECLARE @RESULT BIT;
    SET @RESULT = 0;

    IF @username!=''
        SET @_USERNAME = (
            SELECT CASE WHEN (SELECT 1 FROM [dbo].[USER] WHERE [Username] = @username) IS NULL
            THEN  @username 
            ELSE '' END);
    IF @password!=''
        SET @_PASSWORD = @password;
    IF @age>= 18
        SET @_AGE = @age;
    IF (@_USERNAME != '' AND @_PASSWORD != '' AND @_AGE >= 18)
        INSERT INTO [dbo].[USER]
        ( -- Columns to insert data into
         [Id], [Username], [Password], [Age]
        )
        VALUES
        ( -- First row: values for the columns in the list above
         (@LAST_ID + 1), @_USERNAME, @_PASSWORD, @_AGE
        )
    IF (SELECT 1 FROM [dbo].[USER] WHERE [Username] = @username AND [Password] = @password AND [Age] = @age ) = 1
        SET @RESULT = 1;
    SELECT @RESULT;
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.usp_RegisterProcess 'test@admin.com', '43bdd84a5296ab68dbadfd1de32d4aa8', 18
GO