CREATE TABLE [AWSRC].[Purchasing_Vendor] (
    [BusinessEntityID]        INT             NOT NULL,
    [AccountNumber]           NVARCHAR (15)   NOT NULL,
    [Name]                    NVARCHAR (50)   NOT NULL,
    [CreditRating]            TINYINT         NOT NULL,
    [PreferredVendorStatus]   BIT             NOT NULL,
    [ActiveFlag]              BIT             NOT NULL,
    [PurchasingWebServiceURL] NVARCHAR (1024) NULL,
    [ModifiedDate]            DATETIME        NOT NULL
);

