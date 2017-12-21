CREATE TABLE [WWISRC].[Application_SystemParameters]
(
-- Columns Definition
	[SystemParameterID] int NOT NULL 
,	[DeliveryAddressLine1] nvarchar(60) NOT NULL 
,	[DeliveryAddressLine2] nvarchar(60) 
,	[DeliveryCityID] int NOT NULL 
,	[DeliveryPostalCode] nvarchar(10) NOT NULL 
,	[DeliveryLocation] geography NOT NULL 
,	[PostalAddressLine1] nvarchar(60) NOT NULL 
,	[PostalAddressLine2] nvarchar(60) 
,	[PostalCityID] int NOT NULL 
,	[PostalPostalCode] nvarchar(10) NOT NULL 
,	[ApplicationSettings] nvarchar(max) NOT NULL 
,	[LastEditedBy] int NOT NULL 
,	[LastEditedWhen] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)