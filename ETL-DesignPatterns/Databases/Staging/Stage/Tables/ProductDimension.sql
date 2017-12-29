CREATE TABLE [Stage].[ProductDimension] (
    [ProductDimensionSk]    INT           NOT NULL,
    [SKU]                   VARCHAR (1)   NULL,
    [ProductName]           VARCHAR (100) NULL,
    [ProductDescription]    VARCHAR (100) NULL,
    [ProductType]           VARCHAR (100) NULL,
    [ProductSubtype]        VARCHAR (100) NULL,
    [ProductTypeCode]       VARCHAR (12)  NULL,
    [ProductSubTypeCode]    VARCHAR (100) NULL,
    [ProductColor]          VARCHAR (100) NULL,
    [ProductFamily]         VARCHAR (100) NULL,
    [PreviousProductFamily] VARCHAR (100) NULL,
    [ProductFamily2016]     VARCHAR (100) NULL,
    [ProductFamily2017]     VARCHAR (100) NULL,
    [EndEffectiveDate]      INT           NULL,
    [BeginEffectiveDate]    INT           NULL,
    [IsDeleted]             BIT           NULL,
    [IsCurrent]             BIT           NULL,
    CONSTRAINT [ProductDimension_PK] PRIMARY KEY CLUSTERED ([ProductDimensionSk] ASC)
);

