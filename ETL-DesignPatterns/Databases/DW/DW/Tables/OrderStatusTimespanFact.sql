CREATE TABLE [DW].[OrderStatusTimespanFact] (
    [TimespanFactSk]    INT            IDENTITY (1, 1) NOT NULL,
    [ProductSk]         INT           NULL,
    [CustomerSk]        INT           NULL,
    [StatusDimensionSk] INT           NULL,
    [BeginDate]         DATETIME2 (7) NULL,
    [EndDate]           DATETIME2 (7) NULL
);

