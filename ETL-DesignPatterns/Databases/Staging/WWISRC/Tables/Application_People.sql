CREATE TABLE [WWISRC].[Application_People]
(
-- Columns Definition
	[PersonID] int NOT NULL 
,	[FullName] nvarchar(50) NOT NULL 
,	[PreferredName] nvarchar(50) NOT NULL 
,	[SearchName] nvarchar(101) NOT NULL 
,	[IsPermittedToLogon] bit NOT NULL 
,	[LogonName] nvarchar(50) 
,	[IsExternalLogonProvider] bit NOT NULL 
,	[HashedPassword] varbinary(max) 
,	[IsSystemUser] bit NOT NULL 
,	[IsEmployee] bit NOT NULL 
,	[IsSalesperson] bit NOT NULL 
,	[UserPreferences] nvarchar(max) 
,	[PhoneNumber] nvarchar(20) 
,	[FaxNumber] nvarchar(20) 
,	[EmailAddress] nvarchar(256) 
,	[Photo] varbinary(max) 
,	[CustomFields] nvarchar(max) 
,	[OtherLanguages] nvarchar(max) 
,	[LastEditedBy] int NOT NULL 
,	[ValidFrom] datetime2(7) NOT NULL 
,	[ValidTo] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)