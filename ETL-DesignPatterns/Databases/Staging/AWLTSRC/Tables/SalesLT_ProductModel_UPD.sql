﻿CREATE TABLE [AWLTSRC].[SalesLT_ProductModel_UPD] (
    [ProductModelID]           INT              NOT NULL,
    [Name]                     NVARCHAR (50)    NOT NULL,
    [CatalogDescription]       XML              NULL,
    [rowguid]                  UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]             DATETIME         NOT NULL,
    [ChangeHashKey]            NCHAR (40)       NULL,
    [ChangeType]               CHAR (1)         NOT NULL,
    [IsDeleted]                BIT              NOT NULL,
    [UpdateDate]               DATETIME2 (7)    NULL,
    [UpdatePackageExecutionID] INT              NULL,
    CONSTRAINT [PK_SalesLT_ProductModel_UPD] PRIMARY KEY CLUSTERED ([ProductModelID] ASC)
);

