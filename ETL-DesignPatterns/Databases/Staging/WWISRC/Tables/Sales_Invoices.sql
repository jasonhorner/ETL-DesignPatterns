CREATE TABLE [WWISRC].[Sales_Invoices]
(
-- Columns Definition
	[InvoiceID] int NOT NULL 
,	[CustomerID] int NOT NULL 
,	[BillToCustomerID] int NOT NULL 
,	[OrderID] int 
,	[DeliveryMethodID] int NOT NULL 
,	[ContactPersonID] int NOT NULL 
,	[AccountsPersonID] int NOT NULL 
,	[SalespersonPersonID] int NOT NULL 
,	[PackedByPersonID] int NOT NULL 
,	[InvoiceDate] date NOT NULL 
,	[CustomerPurchaseOrderNumber] nvarchar(20) 
,	[IsCreditNote] bit NOT NULL 
,	[CreditNoteReason] nvarchar(max) 
,	[Comments] nvarchar(max) 
,	[DeliveryInstructions] nvarchar(max) 
,	[InternalComments] nvarchar(max) 
,	[TotalDryItems] int NOT NULL 
,	[TotalChillerItems] int NOT NULL 
,	[DeliveryRun] nvarchar(5) 
,	[RunPosition] nvarchar(5) 
,	[ReturnedDeliveryData] nvarchar(max) 
,	[ConfirmedDeliveryTime] datetime2(7) 
,	[ConfirmedReceivedBy] nvarchar(4000) 
,	[LastEditedBy] int NOT NULL 
,	[LastEditedWhen] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)