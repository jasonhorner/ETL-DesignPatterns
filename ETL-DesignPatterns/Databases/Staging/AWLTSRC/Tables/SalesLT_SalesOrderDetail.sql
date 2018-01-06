﻿CREATE TABLE [AWLTSRC].[SalesLT_SalesOrderDetail] (
    [SalesOrderID]             INT              NOT NULL,
    [SalesOrderDetailID]       INT              NOT NULL,
    [OrderQty]                 SMALLINT         NOT NULL,
    [ProductID]                INT              NOT NULL,
    [UnitPrice]                MONEY            NOT NULL,
    [UnitPriceDiscount]        MONEY            NOT NULL,
    [LineTotal]                DECIMAL (38, 6)  NOT NULL,
    [rowguid]                  UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]             DATETIME         NOT NULL,
    [ChangeHashKey]            NCHAR (40)       NULL,
    [ChangeType]               CHAR (1)         NOT NULL,
    [IsDeleted]                BIT              NOT NULL,
    [InsertDate]               DATETIME2 (7)    NOT NULL,
    [UpdateDate]               DATETIME2 (7)    NULL,
    [InsertPackageExecutionID] INT              NOT NULL,
    [UpdatePackageExecutionID] INT              NULL,
    CONSTRAINT [PK_SalesLT_SalesOrderDetail] PRIMARY KEY CLUSTERED ([SalesOrderID] ASC, [SalesOrderDetailID] ASC)
);



