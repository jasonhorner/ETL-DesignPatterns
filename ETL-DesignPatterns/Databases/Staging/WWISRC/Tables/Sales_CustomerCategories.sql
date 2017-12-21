CREATE TABLE [WWISRC].[Sales_CustomerCategories]
(
-- Columns Definition
	[CustomerCategoryID] int NOT NULL 
,	[CustomerCategoryName] nvarchar(50) NOT NULL 
,	[LastEditedBy] int NOT NULL 
,	[ValidFrom] datetime2(7) NOT NULL 
,	[ValidTo] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)