CREATE TABLE [DW].[OrderStatusFactTable] (
    [FactTableSk]            INT        IDENTITY (1, 1) NOT NULL,
    [OrderDateSk]            INT        NULL,
    [DueDateSk]              INT        NULL,
    [ShipDateSk]             INT        NULL,
    [CancelDateSk]           INT        NULL,
    [CustomerSk]             INT        NOT NULL,
    [BillToAddressId]        INT        NULL,
    [ShipToAddressId]        INT        NULL,
    [CustomerDemographicsSk] INT        NOT NULL,
    [ProductDimensionSk]     INT        NOT NULL,
    [CurrentProductSk]       INT        NULL,
    [SalesQuantity]          TINYINT    NULL,
    [SalesAmount]            SMALLMONEY NULL,
    [DiscountAmount]         SMALLMONEY NULL,
    [TaxAmount]              SMALLMONEY NULL,
    [LineAmount]             SMALLMONEY NULL
);

