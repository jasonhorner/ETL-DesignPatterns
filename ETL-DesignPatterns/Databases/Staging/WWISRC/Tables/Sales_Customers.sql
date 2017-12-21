CREATE TABLE [WWISRC].[Sales_Customers]
(
-- Columns Definition
	[CustomerID] int NOT NULL 
,	[CustomerName] nvarchar(100) NOT NULL 
,	[BillToCustomerID] int NOT NULL 
,	[CustomerCategoryID] int NOT NULL 
,	[BuyingGroupID] int 
,	[PrimaryContactPersonID] int NOT NULL 
,	[AlternateContactPersonID] int 
,	[DeliveryMethodID] int NOT NULL 
,	[DeliveryCityID] int NOT NULL 
,	[PostalCityID] int NOT NULL 
,	[CreditLimit] decimal(18,2) 
,	[AccountOpenedDate] date NOT NULL 
,	[StandardDiscountPercentage] decimal(18,3) NOT NULL 
,	[IsStatementSent] bit NOT NULL 
,	[IsOnCreditHold] bit NOT NULL 
,	[PaymentDays] int NOT NULL 
,	[PhoneNumber] nvarchar(20) NOT NULL 
,	[FaxNumber] nvarchar(20) NOT NULL 
,	[DeliveryRun] nvarchar(5) 
,	[RunPosition] nvarchar(5) 
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