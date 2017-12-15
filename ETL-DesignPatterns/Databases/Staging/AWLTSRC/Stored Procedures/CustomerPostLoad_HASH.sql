CREATE PROCEDURE [AWLTSRC].[CustomerPostLoad_HASH]
AS
BEGIN

SET NOCOUNT ON;

-- Modifcations and new rows in seperate tables
EXECUTE [AWLTSRC].[CustomerDelete];
EXECUTE [AWLTSRC].[CustomerUpdate];
EXECUTE [AWLTSRC].[CustomerInsert];

RETURN 0
END