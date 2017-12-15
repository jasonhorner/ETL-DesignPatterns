CREATE PROCEDURE [AWLTSRC].[CustomerPostLoad_CT]
AS
BEGIN

SET NOCOUNT ON;

-- Modifications(updates and deletes) in a single table
EXECUTE [AWLTSRC].[CustomerMerge];

RETURN 0
END
