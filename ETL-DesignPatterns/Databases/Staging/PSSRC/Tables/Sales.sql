﻿CREATE TABLE [PSSRC].[Sales] (
    [SalesID]                  INT             NOT NULL,
    [FirstName]                VARCHAR (100)   NULL,
    [LastName]                 VARCHAR (100)   NULL,
    [Email]                    VARCHAR (100)   NULL,
    [Birthdate]                DATE            NULL,
    [Gender]                   VARCHAR (10)    NULL,
    [IPAdress]                 VARCHAR (16)    NULL,
    [CountryCode]              VARCHAR (2)     NULL,
    [CountryName]              VARCHAR (50)    NULL,
    [StateCode]                VARCHAR (2)     NULL,
    [StateName]                VARCHAR (50)    NULL,
    [City]                     VARCHAR (50)    NULL,
    [PostalCode]               VARCHAR (10)    NULL,
    [Address]                  VARCHAR (100)   NULL,
    [CreditCardType]           VARCHAR (20)    NULL,
    [CreditCardNumber]         VARCHAR (16)    NULL,
    [Quantity]                 INT             NULL,
    [SalesDate]                DATE            NULL,
    [ProductNumber]            VARCHAR (25)    NULL,
    [SalesAmount]              DECIMAL (10, 2) NULL,
    [ChangeHashKey]            NCHAR (40)      NULL,
    [ChangeType]               CHAR (1)        NULL,
    [IsDeleted]                BIT             NULL,
    [InsertDate]               DATETIME2 (7)   NULL,
    [UpdateDate]               DATETIME2 (7)   NULL,
    [InsertPackageExecutionID] INT             NULL,
    [UpdatePackageExecutionID] INT             NULL,
    CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED ([SalesID] ASC)
);

