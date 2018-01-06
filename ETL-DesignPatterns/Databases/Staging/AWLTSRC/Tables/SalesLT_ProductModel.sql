CREATE TABLE [AWLTSRC].[SalesLT_ProductModel] (
    [ProductModelID]           INT              NOT NULL,
    [Name]                     NVARCHAR (50)    NOT NULL,
    [CatalogDescription]       XML              NULL,
    [rowguid]                  UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]             DATETIME         NOT NULL,
    [ChangeHashKey]            NCHAR (40)       NULL,
    [ChangeType]               CHAR (1)         NOT NULL,
    [IsDeleted]                BIT              NOT NULL,
    [InsertDate]               DATETIME2 (7)    NOT NULL,
    [UpdateDate]               DATETIME2 (7)    NULL,
    [InsertPackageExecutionID] INT              NOT NULL,
    [UpdatePackageExecutionID] INT              NULL,
    CONSTRAINT [PK_SalesLT_ProductModel] PRIMARY KEY CLUSTERED ([ProductModelID] ASC)
);



