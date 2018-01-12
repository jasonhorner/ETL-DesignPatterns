CREATE TABLE [WWISRC].[Purchasing_SupplierCategories_Archive] (
    [SupplierCategoryID]   INT           NOT NULL,
    [SupplierCategoryName] NVARCHAR (50) NOT NULL,
    [LastEditedBy]         INT           NOT NULL,
    [ValidFrom]            DATETIME2 (7) NOT NULL,
    [ValidTo]              DATETIME2 (7) NOT NULL
);

