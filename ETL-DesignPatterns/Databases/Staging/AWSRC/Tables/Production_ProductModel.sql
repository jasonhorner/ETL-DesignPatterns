CREATE TABLE [AWSRC].[Production_ProductModel] (
    [ProductModelID]     INT              NOT NULL,
    [Name]               NVARCHAR (50)    NOT NULL,
    [CatalogDescription] XML              NULL,
    [Instructions]       XML              NULL,
    [rowguid]            UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]       DATETIME         NOT NULL
);

