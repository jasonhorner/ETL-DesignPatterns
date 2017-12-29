CREATE TABLE [Meta].[ProjectType] (
    [ProjectTypeID]          SMALLINT                                           IDENTITY (1, 1) NOT NULL,
    [ProjectType]            VARCHAR (20)                                       NOT NULL,
    [ProjectTypeDescription] VARCHAR (200)                                      NULL,
    [ValidFrom]              DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [ValidTo]                DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    CONSTRAINT [PK_ProjectType] PRIMARY KEY CLUSTERED ([ProjectTypeID] ASC),
    CONSTRAINT [UQ_ProjectType] UNIQUE NONCLUSTERED ([ProjectType] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Meta].[ProjectType_History], DATA_CONSISTENCY_CHECK=ON));

