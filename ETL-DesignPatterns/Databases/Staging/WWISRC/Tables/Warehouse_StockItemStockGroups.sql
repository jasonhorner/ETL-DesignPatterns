CREATE TABLE [WWISRC].[Warehouse_StockItemStockGroups]
(
-- Columns Definition
	[StockItemStockGroupID] int NOT NULL 
,	[StockItemID] int NOT NULL 
,	[StockGroupID] int NOT NULL 
,	[LastEditedBy] int NOT NULL 
,	[LastEditedWhen] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)