CREATE TABLE [DW].[OrderStatusFactTable_UPD] (
    [FactTableSk]                                     INT     NULL,
    [OrderDateSk]                                     INT     NULL,
    [DueDateSk]                                       INT     NULL,
    [ShipDateSk]                                      INT     NULL,
    [CancelDateSk]                                    INT     NULL,
    [SalesFactTable OLE DB Source.CustomerSk]         INT     NULL,
    [BillToAddressId]                                 INT     NULL,
    [ShipToAddressId]                                 INT     NULL,
    [CustomerDemographicsSk]                          INT     NULL,
    [SalesFactTable OLE DB Source.ProductDimensionSk] INT     NULL,
    [CurrentProductSk]                                INT     NULL,
    [SalesQuantity]                                   TINYINT NULL,
    [SalesAmount]                                     MONEY   NULL,
    [DiscountAmount]                                  MONEY   NULL,
    [TaxAmount]                                       MONEY   NULL,
    [LineAmount]                                      MONEY   NULL,
    [CustomerId]                                      INT     NULL,
    [ProductId]                                       INT     NULL,
    [Customer Dimension Lookup.CustomerSk]            INT     NULL,
    [Product Dimension Lookup.ProductDimensionSk]     INT     NULL
);

