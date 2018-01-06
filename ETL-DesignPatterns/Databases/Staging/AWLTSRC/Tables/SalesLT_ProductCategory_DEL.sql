CREATE TABLE [AWLTSRC].[SalesLT_ProductCategory_DEL] (
    [ProductCategoryID]        INT              NOT NULL,
    [ParentProductCategoryID]  INT              NULL,
    [Name]                     NVARCHAR (50)    NOT NULL,
    [rowguid]                  UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]             DATETIME         NOT NULL,
    [ChangeHashKey]            NCHAR (40)       NULL,
    [ChangeType]               CHAR (1)         NOT NULL,
    [IsDeleted]                BIT              NOT NULL,
    [UpdateDate]               DATETIME2 (7)    NULL,
    [UpdatePackageExecutionID] INT              NULL,
    CONSTRAINT [PK_SalesLT_ProductCategory_DEL] PRIMARY KEY CLUSTERED ([ProductCategoryID] ASC)
);

