CREATE TABLE [AWSRC].[Purchasing_PurchaseOrderHeader] (
    [PurchaseOrderID] INT      NOT NULL,
    [RevisionNumber]  TINYINT  NOT NULL,
    [Status]          TINYINT  NOT NULL,
    [EmployeeID]      INT      NOT NULL,
    [VendorID]        INT      NOT NULL,
    [ShipMethodID]    INT      NOT NULL,
    [OrderDate]       DATETIME NOT NULL,
    [ShipDate]        DATETIME NULL,
    [SubTotal]        MONEY    NOT NULL,
    [TaxAmt]          MONEY    NOT NULL,
    [Freight]         MONEY    NOT NULL,
    [TotalDue]        MONEY    NOT NULL,
    [ModifiedDate]    DATETIME NOT NULL
);

