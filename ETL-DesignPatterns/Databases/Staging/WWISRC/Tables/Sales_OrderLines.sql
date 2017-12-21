CREATE TABLE [WWISRC].[Sales_OrderLines]
(
-- Columns Definition
	[OrderLineID] int NOT NULL 
,	[OrderID] int NOT NULL 
,	[StockItemID] int NOT NULL 
,	[Description] nvarchar(100) NOT NULL 
,	[PackageTypeID] int NOT NULL 
,	[Quantity] int NOT NULL 
,	[UnitPrice] decimal(18,2) 
,	[TaxRate] decimal(18,3) NOT NULL 
,	[PickedQuantity] int NOT NULL 
,	[PickingCompletedWhen] datetime2(7) 
,	[LastEditedBy] int NOT NULL 
,	[LastEditedWhen] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)