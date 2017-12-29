CREATE TABLE [AWSRC].[Sales_SalesOrderDetail_ondisk] (
    [SalesOrderID]          INT           NOT NULL,
    [SalesOrderDetailID]    BIGINT        NOT NULL,
    [CarrierTrackingNumber] NVARCHAR (25) NULL,
    [OrderQty]              SMALLINT      NOT NULL,
    [ProductID]             INT           NOT NULL,
    [SpecialOfferID]        INT           NOT NULL,
    [UnitPrice]             MONEY         NOT NULL,
    [UnitPriceDiscount]     MONEY         NOT NULL,
    [ModifiedDate]          DATETIME2 (7) NOT NULL
);

