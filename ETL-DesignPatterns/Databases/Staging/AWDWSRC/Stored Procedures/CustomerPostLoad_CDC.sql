CREATE PROCEDURE [AWDWSRC].[CustomerPostLoad_CDC]
AS
BEGIN

SET NOCOUNT ON;
  
  -- Modifications and New Rows are in single table ()
  EXECUTE [AWDWSRC].[CustomerMerge]

RETURN 0
END