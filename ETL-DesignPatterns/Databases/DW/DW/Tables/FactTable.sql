CREATE TABLE [DW].[FactTable] (
    [FactTableSk]            INT NOT NULL,
    [DateSk]                 INT NULL,
    [CustomerSk]             INT NOT NULL,
    [CustomerDemographicsSk] INT NULL,
    [ProductDimensionSk]     INT NOT NULL,
    [CurrentProductSk]       INT NULL,
    CONSTRAINT [FactTable_PK] PRIMARY KEY CLUSTERED ([FactTableSk] ASC)
);

