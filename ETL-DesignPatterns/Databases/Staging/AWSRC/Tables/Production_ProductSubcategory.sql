CREATE TABLE [AWSRC].[Production_ProductSubcategory] (
    [ProductSubcategoryID] INT              NOT NULL,
    [ProductCategoryID]    INT              NOT NULL,
    [Name]                 NVARCHAR (50)    NOT NULL,
    [rowguid]              UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]         DATETIME         NOT NULL
);

