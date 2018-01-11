CREATE TABLE [DW].[InventorySnapshotFact] (
    [InventorySnapshotSk] INT   IDENTITY (1, 1) NOT NULL,
    [ProductDimensionSk]  INT   NULL,
    [StoreDimensionSk]    INT   NULL,
    [SnapshotDateSk]      INT   NULL,
    [OnHandQuanity]       INT   NULL,
    [OnHandAmount]        MONEY NULL
);

