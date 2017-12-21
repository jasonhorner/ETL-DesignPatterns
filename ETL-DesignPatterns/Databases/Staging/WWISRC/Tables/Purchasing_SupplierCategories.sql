CREATE TABLE [WWISRC].[Purchasing_SupplierCategories]
(
-- Columns Definition
	[SupplierCategoryID] int NOT NULL 
,	[SupplierCategoryName] nvarchar(50) NOT NULL 
,	[LastEditedBy] int NOT NULL 
,	[ValidFrom] datetime2(7) NOT NULL 
,	[ValidTo] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)