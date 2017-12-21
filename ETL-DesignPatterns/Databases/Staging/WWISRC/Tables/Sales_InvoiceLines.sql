CREATE TABLE [WWISRC].[Sales_InvoiceLines]
(
-- Columns Definition
	[InvoiceLineID] int NOT NULL 
,	[InvoiceID] int NOT NULL 
,	[StockItemID] int NOT NULL 
,	[Description] nvarchar(100) NOT NULL 
,	[PackageTypeID] int NOT NULL 
,	[Quantity] int NOT NULL 
,	[UnitPrice] decimal(18,2) 
,	[TaxRate] decimal(18,3) NOT NULL 
,	[TaxAmount] decimal(18,2) NOT NULL 
,	[LineProfit] decimal(18,2) NOT NULL 
,	[ExtendedPrice] decimal(18,2) NOT NULL 
,	[LastEditedBy] int NOT NULL 
,	[LastEditedWhen] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)