CREATE TABLE [Meta].[ItemType] (
    [ItemTypeID]          SMALLINT                                           IDENTITY (1, 1) NOT NULL,
    [ItemType]            VARCHAR (20)                                       NOT NULL,
    [ItemTypeDescription] VARCHAR (200)                                      NULL,
    [ValidFrom]           DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [ValidTo]             DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    CONSTRAINT [PK_ItemType] PRIMARY KEY CLUSTERED ([ItemTypeID] ASC),
    CONSTRAINT [UQ_ItemType] UNIQUE NONCLUSTERED ([ItemType] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Meta].[ItemType_History], DATA_CONSISTENCY_CHECK=ON));

