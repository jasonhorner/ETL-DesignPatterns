﻿CREATE TABLE [DWStage].[CustomerDimension_SCD1] (
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
    [CurrentDemographicsSk] INT            NULL,
    [InsertDate]            DATE           NULL,
    [UpdateDate]            DATE           NULL,
    [ChangeHashKey]         CHAR (40)      NULL,
    CONSTRAINT [Stage_CustomerSCD1_PK] PRIMARY KEY CLUSTERED ([CustomerSk] ASC)
);



