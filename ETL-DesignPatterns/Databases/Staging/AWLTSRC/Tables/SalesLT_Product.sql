﻿CREATE TABLE [AWLTSRC].[SalesLT_Product] (
    [ProductID]                INT              NOT NULL,
    [Name]                     NVARCHAR (50)    NOT NULL,
    [ProductNumber]            NVARCHAR (25)    NOT NULL,
    [Color]                    NVARCHAR (15)    NULL,
    [StandardCost]             MONEY            NOT NULL,
    [ListPrice]                MONEY            NOT NULL,
    [Size]                     NVARCHAR (5)     NULL,
    [Weight]                   DECIMAL (8, 2)   NULL,
    [ProductCategoryID]        INT              NULL,
    [ProductModelID]           INT              NULL,
    [SellStartDate]            DATETIME         NOT NULL,
    [SellEndDate]              DATETIME         NULL,
    [DiscontinuedDate]         DATETIME         NULL,
    [ThumbNailPhoto]           VARBINARY (MAX)  NULL,
    [ThumbnailPhotoFileName]   NVARCHAR (50)    NULL,
    [rowguid]                  UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]             DATETIME         NOT NULL,
    [ChangeHashKey]            NCHAR (40)       NULL,
    [ChangeType]               CHAR (1)         NOT NULL,
    [IsDeleted]                BIT              NOT NULL,
    [InsertDate]               DATETIME2 (7)    NOT NULL,
    [UpdateDate]               DATETIME2 (7)    NULL,
    [InsertPackageExecutionID] INT              NOT NULL,
    [UpdatePackageExecutionID] INT              NULL,
    CONSTRAINT [PK_SalesLT_Product] PRIMARY KEY CLUSTERED ([ProductID] ASC)
);



