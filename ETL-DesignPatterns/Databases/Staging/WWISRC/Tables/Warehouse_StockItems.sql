CREATE TABLE [WWISRC].[Warehouse_StockItems]
(
-- Columns Definition
	[StockItemID] int NOT NULL 
,	[StockItemName] nvarchar(100) NOT NULL 
,	[SupplierID] int NOT NULL 
,	[ColorID] int 
,	[UnitPackageID] int NOT NULL 
,	[OuterPackageID] int NOT NULL 
,	[Brand] nvarchar(50) 
,	[Size] nvarchar(20) 
,	[LeadTimeDays] int NOT NULL 
,	[QuantityPerOuter] int NOT NULL 
,	[IsChillerStock] bit NOT NULL 
,	[Barcode] nvarchar(50) 
,	[TaxRate] decimal(18,3) NOT NULL 
,	[UnitPrice] decimal(18,2) NOT NULL 
,	[RecommendedRetailPrice] decimal(18,2) 
,	[TypicalWeightPerUnit] decimal(18,3) NOT NULL 
,	[MarketingComments] nvarchar(max) 
,	[InternalComments] nvarchar(max) 
,	[Photo] varbinary(max) 
,	[CustomFields] nvarchar(max) 
,	[Tags] nvarchar(max) 
,	[SearchDetails] nvarchar(max) NOT NULL 
,	[LastEditedBy] int NOT NULL 
,	[ValidFrom] datetime2(7) NOT NULL 
,	[ValidTo] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)