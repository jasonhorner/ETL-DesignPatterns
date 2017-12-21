CREATE TABLE [WWISRC].[Purchasing_SupplierTransactions]
(
-- Columns Definition
	[SupplierTransactionID] int NOT NULL 
,	[SupplierID] int NOT NULL 
,	[TransactionTypeID] int NOT NULL 
,	[PurchaseOrderID] int 
,	[PaymentMethodID] int 
,	[SupplierInvoiceNumber] nvarchar(20) 
,	[TransactionDate] date NOT NULL 
,	[AmountExcludingTax] decimal(18,2) NOT NULL 
,	[TaxAmount] decimal(18,2) NOT NULL 
,	[TransactionAmount] decimal(18,2) NOT NULL 
,	[OutstandingBalance] decimal(18,2) NOT NULL 
,	[FinalizationDate] date 
,	[IsFinalized] bit 
,	[LastEditedBy] int NOT NULL 
,	[LastEditedWhen] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)