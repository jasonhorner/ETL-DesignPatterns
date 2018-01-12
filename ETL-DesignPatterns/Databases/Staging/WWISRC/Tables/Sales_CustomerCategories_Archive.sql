CREATE TABLE [WWISRC].[Sales_CustomerCategories_Archive] (
    [CustomerCategoryID]   INT           NOT NULL,
    [CustomerCategoryName] NVARCHAR (50) NOT NULL,
    [LastEditedBy]         INT           NOT NULL,
    [ValidFrom]            DATETIME2 (7) NOT NULL,
    [ValidTo]              DATETIME2 (7) NOT NULL
);

