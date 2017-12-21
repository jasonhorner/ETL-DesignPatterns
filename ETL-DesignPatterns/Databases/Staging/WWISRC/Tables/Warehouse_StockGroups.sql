CREATE TABLE [WWISRC].[Warehouse_StockGroups]
(
-- Columns Definition
	[StockGroupID] int NOT NULL 
,	[StockGroupName] nvarchar(50) NOT NULL 
,	[LastEditedBy] int NOT NULL 
,	[ValidFrom] datetime2(7) NOT NULL 
,	[ValidTo] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)