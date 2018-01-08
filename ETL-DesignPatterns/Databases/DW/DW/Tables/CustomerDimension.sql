CREATE TABLE [DW].[CustomerDimension] (
    [CustomerDimensionSk]            INT           NOT NULL IDENTITY,
    [CustomerId]            INT           NOT NULL, 
    [FirstName]             VARCHAR (50)  NULL,
    [LastName]              VARCHAR (100) NULL,
    [Birthdate]             DATE          NULL,
    [AgeBand]               VARCHAR (25)  NULL,
    [MaritalStatus]         VARCHAR (12)  NULL,
    [PurchaseFrequency]     VARCHAR (100) NULL,
    [IncomeLevel]           VARCHAR (50)  NULL,
    [Address]               VARCHAR (100) NULL,
    [City]                  VARCHAR (50)  NULL,
    [StateName]             VARCHAR (100) NULL,
	[StateCode]             CHAR(2) NULL, 
    [PostalCode]            VARCHAR (25)  NULL,
    [CurrentDemographicsSk] INT           NULL, 
	[SCD1ChangeHashKey]    NCHAR (40)    NULL,
	[SCD2ChangeHashKey]    NCHAR (40)    NULL,
    [BeginEffectiveDate]    DATE          NULL,
    [EndEffectiveDate]      DATE          NULL,
    [IsCurrent]             BIT           NOT NULL DEFAULT 1,
	[IsDeleted]                BIT              NOT NULL DEFAULT 0,
    [InsertDate]               DATETIME2 (7)    NOT NULL,
    [UpdateDate]               DATETIME2 (7)    NULL,
    [InsertPackageExecutionID] INT              NOT NULL DEFAULT -1,
    [UpdatePackageExecutionID] INT              NULL DEFAULT -1,
    CONSTRAINT [DW_CustomerDimension_PK] PRIMARY KEY CLUSTERED ([CustomerDimensionSk] ASC), 
    CONSTRAINT [DW_CustomerDimension_AK] UNIQUE ([CustomerId], [BeginEffectiveDate])
);


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'SK',
    @level0type = N'SCHEMA',
    @level0name = N'DW',
    @level1type = N'TABLE',
    @level1name = N'CustomerDimension',
    @level2type = N'COLUMN',
    @level2name = N'CustomerDimensionSk'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'AK',
    @level0type = N'SCHEMA',
    @level0name = N'DW',
    @level1type = N'TABLE',
    @level1name = N'CustomerDimension',
    @level2type = N'COLUMN',
    @level2name = N'CustomerId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'SCD Type 2',
    @level0type = N'SCHEMA',
    @level0name = N'DW',
    @level1type = N'TABLE',
    @level1name = N'CustomerDimension',
    @level2type = N'COLUMN',
    @level2name = N'IsCurrent'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Audit',
    @level0type = N'SCHEMA',
    @level0name = N'DW',
    @level1type = N'TABLE',
    @level1name = N'CustomerDimension',
    @level2type = N'COLUMN',
    @level2name = N'IsDeleted'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Audit',
    @level0type = N'SCHEMA',
    @level0name = N'DW',
    @level1type = N'TABLE',
    @level1name = N'CustomerDimension',
    @level2type = N'COLUMN',
    @level2name = N'InsertDate'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Audit',
    @level0type = N'SCHEMA',
    @level0name = N'DW',
    @level1type = N'TABLE',
    @level1name = N'CustomerDimension',
    @level2type = N'COLUMN',
    @level2name = N'UpdateDate'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Audit',
    @level0type = N'SCHEMA',
    @level0name = N'DW',
    @level1type = N'TABLE',
    @level1name = N'CustomerDimension',
    @level2type = N'COLUMN',
    @level2name = N'InsertPackageExecutionID'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Audit',
    @level0type = N'SCHEMA',
    @level0name = N'DW',
    @level1type = N'TABLE',
    @level1name = N'CustomerDimension',
    @level2type = N'COLUMN',
    @level2name = N'UpdatePackageExecutionID'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'SCD Type 2',
    @level0type = N'SCHEMA',
    @level0name = N'DW',
    @level1type = N'TABLE',
    @level1name = N'CustomerDimension',
    @level2type = N'COLUMN',
    @level2name = N'EndEffectiveDate'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'SCD Type 2',
    @level0type = N'SCHEMA',
    @level0name = N'DW',
    @level1type = N'TABLE',
    @level1name = N'CustomerDimension',
    @level2type = N'COLUMN',
    @level2name = N'BeginEffectiveDate'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'SCD Type 2',
    @level0type = N'SCHEMA',
    @level0name = N'DW',
    @level1type = N'TABLE',
    @level1name = N'CustomerDimension',
    @level2type = N'COLUMN',
    @level2name = N'SCD2ChangeHashKey'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'SCD Type 1',
    @level0type = N'SCHEMA',
    @level0name = N'DW',
    @level1type = N'TABLE',
    @level1name = N'CustomerDimension',
    @level2type = N'COLUMN',
    @level2name = N'SCD1ChangeHashKey'