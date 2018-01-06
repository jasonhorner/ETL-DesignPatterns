CREATE TABLE [AWLTSRC].[SalesLT_SalesOrderDetail_INS] (
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
    [InsertPackageExecutionID] INT              NOT NULL,
    CONSTRAINT [PK_SalesLT_SalesOrderDetail_INS] PRIMARY KEY CLUSTERED ([SalesOrderID] ASC, [SalesOrderDetailID] ASC)
);

