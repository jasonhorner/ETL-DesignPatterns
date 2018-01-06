CREATE TABLE [AWLTSRC].[SalesLT_ProductCategory_INS] (
    [ProductCategoryID]        INT              NOT NULL,
    [ParentProductCategoryID]  INT              NULL,
    [Name]                     NVARCHAR (50)    NOT NULL,
    [rowguid]                  UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]             DATETIME         NOT NULL,
    [ChangeHashKey]            NCHAR (40)       NULL,
    [ChangeType]               CHAR (1)         NOT NULL,
    [IsDeleted]                BIT              NOT NULL,
    [InsertDate]               DATETIME2 (7)    NOT NULL,
    [InsertPackageExecutionID] INT              NOT NULL,
    CONSTRAINT [PK_SalesLT_ProductCategory_INS] PRIMARY KEY CLUSTERED ([ProductCategoryID] ASC)
);

