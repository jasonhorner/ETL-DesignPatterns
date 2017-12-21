CREATE TABLE [WWISRC].[Purchasing_Suppliers]
(
-- Columns Definition
	[SupplierID] int NOT NULL 
,	[SupplierName] nvarchar(100) NOT NULL 
,	[SupplierCategoryID] int NOT NULL 
,	[PrimaryContactPersonID] int NOT NULL 
,	[AlternateContactPersonID] int NOT NULL 
,	[DeliveryMethodID] int 
,	[DeliveryCityID] int NOT NULL 
,	[PostalCityID] int NOT NULL 
,	[SupplierReference] nvarchar(20) 
,	[BankAccountName] nvarchar(50) 
,	[BankAccountBranch] nvarchar(50) 
,	[BankAccountCode] nvarchar(20) 
,	[BankAccountNumber] nvarchar(20) 
,	[BankInternationalCode] nvarchar(20) 
,	[PaymentDays] int NOT NULL 
,	[InternalComments] nvarchar(max) 
,	[PhoneNumber] nvarchar(20) NOT NULL 
,	[FaxNumber] nvarchar(20) NOT NULL 
,	[WebsiteURL] nvarchar(256) NOT NULL 
,	[DeliveryAddressLine1] nvarchar(60) NOT NULL 
,	[DeliveryAddressLine2] nvarchar(60) 
,	[DeliveryPostalCode] nvarchar(10) NOT NULL 
,	[DeliveryLocation] geography 
,	[PostalAddressLine1] nvarchar(60) NOT NULL 
,	[PostalAddressLine2] nvarchar(60) 
,	[PostalPostalCode] nvarchar(10) NOT NULL 
,	[LastEditedBy] int NOT NULL 
,	[ValidFrom] datetime2(7) NOT NULL 
,	[ValidTo] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)