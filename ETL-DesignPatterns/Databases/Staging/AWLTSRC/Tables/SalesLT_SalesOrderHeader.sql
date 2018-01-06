﻿CREATE TABLE [AWLTSRC].[SalesLT_SalesOrderHeader] (
    [SalesOrderID]             INT              NOT NULL,
    [RevisionNumber]           TINYINT          NOT NULL,
    [OrderDate]                DATETIME         NOT NULL,
    [DueDate]                  DATETIME         NOT NULL,
    [ShipDate]                 DATETIME         NULL,
    [Status]                   TINYINT          NOT NULL,
    [OnlineOrderFlag]          BIT              NOT NULL,
    [SalesOrderNumber]         NVARCHAR (25)    NOT NULL,
    [PurchaseOrderNumber]      NVARCHAR (25)    NULL,
    [AccountNumber]            NVARCHAR (15)    NULL,
    [CustomerID]               INT              NOT NULL,
    [ShipToAddressID]          INT              NULL,
    [BillToAddressID]          INT              NULL,
    [ShipMethod]               NVARCHAR (50)    NOT NULL,
    [CreditCardApprovalCode]   VARCHAR (15)     NULL,
    [SubTotal]                 MONEY            NOT NULL,
    [TaxAmt]                   MONEY            NOT NULL,
    [Freight]                  MONEY            NOT NULL,
    [TotalDue]                 MONEY            NOT NULL,
    [Comment]                  NVARCHAR (MAX)   NULL,
    [rowguid]                  UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]             DATETIME         NOT NULL,
    [ChangeHashKey]            NCHAR (40)       NULL,
    [ChangeType]               CHAR (1)         NOT NULL,
    [IsDeleted]                BIT              NOT NULL,
    [InsertDate]               DATETIME2 (7)    NOT NULL,
    [UpdateDate]               DATETIME2 (7)    NULL,
    [InsertPackageExecutionID] INT              NOT NULL,
    [UpdatePackageExecutionID] INT              NULL,
    CONSTRAINT [PK_SalesLT_SalesOrderHeader] PRIMARY KEY CLUSTERED ([SalesOrderID] ASC)
);



