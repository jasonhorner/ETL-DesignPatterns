CREATE PROCEDURE [dbo].[CustomerPreLoad_HASH]
	@initStagingTable bit = 0
AS
BEGIN

SET NOCOUNT ON;

IF @initStagingTable  = 1
BEGIN

TRUNCATE TABLE [AWLTSRC].[Customer];

END


-- Remove Data From Staging tables
TRUNCATE TABLE [AWLTSRC].[Customer_DEL];
TRUNCATE TABLE [AWLTSRC].[Customer_UPD];
TRUNCATE TABLE [AWLTSRC].[Customer_INS];
	

RETURN 0
END
