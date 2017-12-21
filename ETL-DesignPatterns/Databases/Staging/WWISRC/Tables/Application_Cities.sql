CREATE TABLE [WWISRC].[Application_Cities]
(
-- Columns Definition
	[CityID] int NOT NULL 
,	[CityName] nvarchar(50) NOT NULL 
,	[StateProvinceID] int NOT NULL 
,	[Location] geography 
,	[LatestRecordedPopulation] bigint 
,	[LastEditedBy] int NOT NULL 
,	[ValidFrom] datetime2(7) NOT NULL 
,	[ValidTo] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)