CREATE TABLE [WWISRC].[Warehouse_Colors]
(
-- Columns Definition
	[ColorID] int NOT NULL 
,	[ColorName] nvarchar(20) NOT NULL 
,	[LastEditedBy] int NOT NULL 
,	[ValidFrom] datetime2(7) NOT NULL 
,	[ValidTo] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)