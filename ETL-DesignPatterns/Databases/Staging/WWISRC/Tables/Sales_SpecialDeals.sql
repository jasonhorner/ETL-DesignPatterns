CREATE TABLE [WWISRC].[Sales_SpecialDeals]
(
-- Columns Definition
	[SpecialDealID] int NOT NULL 
,	[StockItemID] int 
,	[CustomerID] int 
,	[BuyingGroupID] int 
,	[CustomerCategoryID] int 
,	[StockGroupID] int 
,	[DealDescription] nvarchar(30) NOT NULL 
,	[StartDate] date NOT NULL 
,	[EndDate] date NOT NULL 
,	[DiscountAmount] decimal(18,2) 
,	[DiscountPercentage] decimal(18,3) 
,	[UnitPrice] decimal(18,2) 
,	[LastEditedBy] int NOT NULL 
,	[LastEditedWhen] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)