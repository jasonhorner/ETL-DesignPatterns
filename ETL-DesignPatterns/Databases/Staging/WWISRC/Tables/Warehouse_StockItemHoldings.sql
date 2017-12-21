CREATE TABLE [WWISRC].[Warehouse_StockItemHoldings]
(
-- Columns Definition
	[StockItemID] int NOT NULL 
,	[QuantityOnHand] int NOT NULL 
,	[BinLocation] nvarchar(20) NOT NULL 
,	[LastStocktakeQuantity] int NOT NULL 
,	[LastCostPrice] decimal(18,2) NOT NULL 
,	[ReorderLevel] int NOT NULL 
,	[TargetStockLevel] int NOT NULL 
,	[LastEditedBy] int NOT NULL 
,	[LastEditedWhen] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)