CREATE TABLE [AWLTSRC].[SalesLT_ProductCategory] (
    [ProductCategoryID]       INT              NOT NULL,
    [ParentProductCategoryID] INT              NULL,
    [Name]                    NVARCHAR (50)    NOT NULL,
    [rowguid]                 UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]            DATETIME         NOT NULL
);

