CREATE TABLE [WWISRC].[Warehouse_StockGroups_Archive] (
    [StockGroupID]   INT           NOT NULL,
    [StockGroupName] NVARCHAR (50) NOT NULL,
    [LastEditedBy]   INT           NOT NULL,
    [ValidFrom]      DATETIME2 (7) NOT NULL,
    [ValidTo]        DATETIME2 (7) NOT NULL
);

