CREATE TABLE [AWSRC].[Demo_DemoSalesOrderHeaderSeed] (
    [DueDate]         DATETIME2 (7) NOT NULL,
    [CustomerID]      INT           NOT NULL,
    [SalesPersonID]   INT           NOT NULL,
    [BillToAddressID] INT           NOT NULL,
    [ShipToAddressID] INT           NOT NULL,
    [ShipMethodID]    INT           NOT NULL,
    [LocalID]         INT           NOT NULL
);

