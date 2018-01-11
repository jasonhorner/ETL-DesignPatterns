CREATE TABLE [DW].[InventorySnapshotFact] (
    [InventorySnapshotSk] INT   NULL,
    [ProductDimensionSk]  INT   NULL,
    [StoreDimensionSk]    INT   NULL,
    [SnapshotDateSk]      INT   NULL,
    [OnHandQuanity]       INT   NULL,
    [OnHandAmount]        MONEY NULL
);

