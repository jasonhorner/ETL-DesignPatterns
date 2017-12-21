CREATE TABLE [WWISRC].[Application_StateProvinces]
(
-- Columns Definition
	[StateProvinceID] int NOT NULL 
,	[StateProvinceCode] nvarchar(5) NOT NULL 
,	[StateProvinceName] nvarchar(50) NOT NULL 
,	[CountryID] int NOT NULL 
,	[SalesTerritory] nvarchar(50) NOT NULL 
,	[Border] geography 
,	[LatestRecordedPopulation] bigint 
,	[LastEditedBy] int NOT NULL 
,	[ValidFrom] datetime2(7) NOT NULL 
,	[ValidTo] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)