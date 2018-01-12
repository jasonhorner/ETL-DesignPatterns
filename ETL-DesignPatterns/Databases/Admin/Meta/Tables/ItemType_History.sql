CREATE TABLE [Meta].[ItemType_History] (
    [ItemTypeID]          SMALLINT      NOT NULL,
    [ItemType]            VARCHAR (20)  NOT NULL,
    [ItemTypeDescription] VARCHAR (200) NULL,
    [ValidFrom]           DATETIME2 (7) NOT NULL,
    [ValidTo]             DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_ItemType_History]
    ON [Meta].[ItemType_History]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

