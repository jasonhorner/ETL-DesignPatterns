CREATE TABLE [WWISRC].[Sales_CustomerTransactions]
(
-- Columns Definition
	[CustomerTransactionID] int NOT NULL 
,	[CustomerID] int NOT NULL 
,	[TransactionTypeID] int NOT NULL 
,	[InvoiceID] int 
,	[PaymentMethodID] int 
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