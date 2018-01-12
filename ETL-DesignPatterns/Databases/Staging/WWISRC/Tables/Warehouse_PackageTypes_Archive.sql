CREATE TABLE [WWISRC].[Warehouse_PackageTypes_Archive] (
    [PackageTypeID]   INT           NOT NULL,
    [PackageTypeName] NVARCHAR (50) NOT NULL,
    [LastEditedBy]    INT           NOT NULL,
    [ValidFrom]       DATETIME2 (7) NOT NULL,
    [ValidTo]         DATETIME2 (7) NOT NULL
);

