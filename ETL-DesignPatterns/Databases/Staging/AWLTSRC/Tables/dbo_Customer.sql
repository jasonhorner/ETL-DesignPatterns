﻿CREATE TABLE [AWLTSRC].[dbo_Customer] (
    [CustomerID]               INT           NOT NULL,
    [FirstName]                NVARCHAR (50) NOT NULL,
    [LastName]                 NVARCHAR (50) NOT NULL,
    [EmailAddress]             NVARCHAR (50) NULL,
    [ChangeHashKey]            NCHAR (40)    NULL,
    [ChangeType]               CHAR (1)      NULL,
    [IsDeleted]                BIT           NULL,
    [InsertDate]               DATETIME2 (7) NULL,
    [UpdateDate]               DATETIME2 (7) NULL,
    [InsertPackageExecutionID] INT           NULL,
    [UpdatePackageExecutionID] INT           NULL,
    CONSTRAINT [PK_dbo_Customer] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);



