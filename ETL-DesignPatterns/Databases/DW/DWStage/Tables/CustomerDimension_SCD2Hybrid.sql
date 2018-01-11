﻿CREATE TABLE [DWStage].[CustomerDimension_SCD2Hybrid] (
    [CustomerSk]            INT            NOT NULL,
    [CustomerId]            INT            NULL,
    [FirstName]             NVARCHAR (50)  NULL,
    [LastName]              NVARCHAR (100) NULL,
    [Birthdate]             DATE           NULL,
    [AgeBand]               NVARCHAR (25)  NULL,
    [MaritalStatus]         NVARCHAR (12)  NULL,
    [PurchaseFrequency]     NVARCHAR (100) NULL,
    [IncomeLevel]           NVARCHAR (50)  NULL,
    [Address]               NVARCHAR (100) NULL,
    [City]                  NVARCHAR (50)  NULL,
    [State]                 NVARCHAR (100) NULL,
    [PostalCode]            NVARCHAR (25)  NULL,
    [CurrentDemographicsSk] INT            NOT NULL,
    [SCD1ChangeHashKey]     NCHAR (40)     NULL,
    [SCD2ChangeHashKey]     NCHAR (40)     NULL,
    [BeginEffectiveDate]    DATE           NULL,
    [EndEffectiveDate]      DATE           NULL,
    [IsCurrent]             BIT            NULL,
    CONSTRAINT [DWStage_CustomerSCD2Hybrid_PK] PRIMARY KEY CLUSTERED ([CustomerSk] ASC)
);

