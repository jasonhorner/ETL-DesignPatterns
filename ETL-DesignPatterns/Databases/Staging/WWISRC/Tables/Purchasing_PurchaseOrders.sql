CREATE TABLE [WWISRC].[Purchasing_PurchaseOrders]
(
-- Columns Definition
	[PurchaseOrderID] int NOT NULL 
,	[SupplierID] int NOT NULL 
,	[OrderDate] date NOT NULL 
,	[DeliveryMethodID] int NOT NULL 
,	[ContactPersonID] int NOT NULL 
,	[ExpectedDeliveryDate] date 
,	[SupplierReference] nvarchar(20) 
,	[IsOrderFinalized] bit NOT NULL 
,	[Comments] nvarchar(max) 
,	[InternalComments] nvarchar(max) 
,	[LastEditedBy] int NOT NULL 
,	[LastEditedWhen] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)