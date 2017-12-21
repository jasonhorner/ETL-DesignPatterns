CREATE TABLE [WWISRC].[Sales_BuyingGroups]
(
-- Columns Definition
	[BuyingGroupID] int NOT NULL 
,	[BuyingGroupName] nvarchar(50) NOT NULL 
,	[LastEditedBy] int NOT NULL 
,	[ValidFrom] datetime2(7) NOT NULL 
,	[ValidTo] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)