CREATE TABLE [Meta].[ProjectType_History] (
    [ProjectTypeID]          SMALLINT      NOT NULL,
    [ProjectType]            VARCHAR (20)  NOT NULL,
    [ProjectTypeDescription] VARCHAR (200) NULL,
    [ValidFrom]              DATETIME2 (7) NOT NULL,
    [ValidTo]                DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_ProjectType_History]
    ON [Meta].[ProjectType_History]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

