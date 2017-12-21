CREATE TABLE [WWISRC].[Purchasing_PurchaseOrderLines]
(
-- Columns Definition
	[PurchaseOrderLineID] int NOT NULL 
,	[PurchaseOrderID] int NOT NULL 
,	[StockItemID] int NOT NULL 
,	[OrderedOuters] int NOT NULL 
,	[Description] nvarchar(100) NOT NULL 
,	[ReceivedOuters] int NOT NULL 
,	[PackageTypeID] int NOT NULL 
,	[ExpectedUnitPricePerOuter] decimal(18,2) 
,	[LastReceiptDate] date 
,	[IsOrderLineFinalized] bit NOT NULL 
,	[LastEditedBy] int NOT NULL 
,	[LastEditedWhen] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)