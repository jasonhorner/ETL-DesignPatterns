CREATE TABLE [AWSRC].[Sales_CustomerPII] (
    [CustomerID]       INT           NOT NULL,
    [FirstName]        NVARCHAR (50) NOT NULL,
    [LastName]         NVARCHAR (50) NOT NULL,
    [SSN]              NVARCHAR (11) NULL,
    [CreditCardNumber] NVARCHAR (25) NULL,
    [EmailAddress]     NVARCHAR (50) NULL,
    [PhoneNumber]      NVARCHAR (25) NULL,
    [TerritoryID]      INT           NULL
);

