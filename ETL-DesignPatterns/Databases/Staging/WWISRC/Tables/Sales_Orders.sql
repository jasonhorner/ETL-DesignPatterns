CREATE TABLE [WWISRC].[Sales_Orders]
(
-- Columns Definition
	[OrderID] int NOT NULL 
,	[CustomerID] int NOT NULL 
,	[SalespersonPersonID] int NOT NULL 
,	[PickedByPersonID] int 
,	[ContactPersonID] int NOT NULL 
,	[BackorderOrderID] int 
,	[OrderDate] date NOT NULL 
,	[ExpectedDeliveryDate] date NOT NULL 
,	[CustomerPurchaseOrderNumber] nvarchar(20) 
,	[IsUndersupplyBackordered] bit NOT NULL 
,	[Comments] nvarchar(max) 
,	[DeliveryInstructions] nvarchar(max) 
,	[InternalComments] nvarchar(max) 
,	[PickingCompletedWhen] datetime2(7) 
,	[LastEditedBy] int NOT NULL 
,	[LastEditedWhen] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)