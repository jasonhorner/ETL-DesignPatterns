CREATE TABLE [WWISRC].[Warehouse_StockItemTransactions]
(
-- Columns Definition
	[StockItemTransactionID] int NOT NULL 
,	[StockItemID] int NOT NULL 
,	[TransactionTypeID] int NOT NULL 
,	[CustomerID] int 
,	[InvoiceID] int 
,	[SupplierID] int 
,	[PurchaseOrderID] int 
,	[TransactionOccurredWhen] datetime2(7) NOT NULL 
,	[Quantity] decimal(18,3) NOT NULL 
,	[LastEditedBy] int NOT NULL 
,	[LastEditedWhen] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)