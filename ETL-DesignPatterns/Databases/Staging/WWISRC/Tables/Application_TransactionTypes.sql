CREATE TABLE [WWISRC].[Application_TransactionTypes]
(
-- Columns Definition
	[TransactionTypeID] int NOT NULL 
,	[TransactionTypeName] nvarchar(50) NOT NULL 
,	[LastEditedBy] int NOT NULL 
,	[ValidFrom] datetime2(7) NOT NULL 
,	[ValidTo] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)