CREATE TABLE [Meta].[ConnectionManagerType_History] (
    [ConnectionManagerTypeID]          SMALLINT      NOT NULL,
    [ConnectionManagerType]            VARCHAR (20)  NOT NULL,
    [ConnectionManagerTypeDescription] VARCHAR (200) NULL,
    [ValidFrom]                        DATETIME2 (7) NOT NULL,
    [ValidTo]                          DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_ConnectionManagerType_History]
    ON [Meta].[ConnectionManagerType_History]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

