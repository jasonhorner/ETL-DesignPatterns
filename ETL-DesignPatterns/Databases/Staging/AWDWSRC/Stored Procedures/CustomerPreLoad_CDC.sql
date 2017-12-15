CREATE PROCEDURE [AWDWSRC].[CustomerPreLoad_CDC]
	@initStagingTable bit = 0
AS
BEGIN

SET NOCOUNT ON;

IF @initStagingTable  = 1
BEGIN

TRUNCATE TABLE [AWDWSRC].[Customer];

END


-- Remove Data From Staging tables
--TRUNCATE TABLE [AWDWSRC].[Customer_DEL];
--TRUNCATE TABLE [AWDWSRC].[Customer_UPD];
--TRUNCATE TABLE [AWDWSRC].[Customer_INS];
	

RETURN 0
END