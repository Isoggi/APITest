USE master
USE DBTest
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'usp_LoginProcess'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.usp_LoginProcess
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.usp_LoginProcess
    @username /*parameter name*/ NVARCHAR(50) /*datatype_for_param1*/ = '', /*default_value_for_param1*/
    @password /*parameter name*/ NVARCHAR(50) /*datatype_for_param2*/ = '' /*default_value_for_param2*/
-- add more stored procedure parameters here
AS
DECLARE @_USERNAME NVARCHAR(50);
SET @_USERNAME = '';
DECLARE @_PASSWORD NVARCHAR(50);
SET @_PASSWORD = '';
DECLARE @RESULT BIT;
SET @RESULT = 0;

IF @username!=''
    SET @_USERNAME = (SELECT TOP 1 [Username]
    FROM [dbo].[USER] WHERE Username =  @username );
IF @_USERNAME!=''
    SET @_PASSWORD = (SELECT TOP 1 [Password]
    FROM [dbo].[USER] WHERE Username =  @_USERNAME);
IF @_PASSWORD!=@password
    SET @RESULT = 1;
SELECT @RESULT;
GO
EXECUTE dbo.usp_LoginProcess 'admin@admin.com', '43bdd84a5296ab68dbadfd1de32d4aa8'
GO