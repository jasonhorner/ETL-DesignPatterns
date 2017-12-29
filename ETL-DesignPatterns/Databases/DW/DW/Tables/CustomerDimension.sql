CREATE TABLE [DW].[CustomerDimension] (
    [CustomerSk]            INT           NOT NULL,
    [CustomerId]            INT           NULL,
    [FirstName]             VARCHAR (50)  NULL,
    [LastName]              VARCHAR (100) NULL,
    [Birthdate]             DATE          NULL,
    [AgeBand]               VARCHAR (25)  NULL,
    [MaritalStatus]         VARCHAR (12)  NULL,
    [PurchaseFrequency]     VARCHAR (100) NULL,
    [IncomeLevel]           VARCHAR (50)  NULL,
    [Address]               VARCHAR (100) NULL,
    [City]                  VARCHAR (50)  NULL,
    [State]                 VARCHAR (100) NULL,
    [PostalCode]            VARCHAR (25)  NULL,
    [CurrentDemographicsSk] INT           NOT NULL,
    [BeginEffectiveDate]    DATE          NULL,
    [EndEffectiveDate]      DATE          NULL,
    [IsCurrent]             BIT           NULL,
    CONSTRAINT [Stage_Customer_PK] PRIMARY KEY CLUSTERED ([CustomerSk] ASC)
);

