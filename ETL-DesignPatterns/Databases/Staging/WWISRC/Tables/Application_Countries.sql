CREATE TABLE [WWISRC].[Application_Countries]
(
-- Columns Definition
	[CountryID] int NOT NULL 
,	[CountryName] nvarchar(60) NOT NULL 
,	[FormalName] nvarchar(60) NOT NULL 
,	[IsoAlpha3Code] nvarchar(3) 
,	[IsoNumericCode] int 
,	[CountryType] nvarchar(20) 
,	[LatestRecordedPopulation] bigint 
,	[Continent] nvarchar(30) NOT NULL 
,	[Region] nvarchar(30) NOT NULL 
,	[Subregion] nvarchar(30) NOT NULL 
,	[Border] geography 
,	[LastEditedBy] int NOT NULL 
,	[ValidFrom] datetime2(7) NOT NULL 
,	[ValidTo] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)