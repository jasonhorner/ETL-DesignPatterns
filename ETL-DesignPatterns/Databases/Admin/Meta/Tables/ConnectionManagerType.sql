CREATE TABLE [Meta].[ConnectionManagerType] (
    [ConnectionManagerTypeID]          SMALLINT                                           IDENTITY (1, 1) NOT NULL,
    [ConnectionManagerType]            VARCHAR (20)                                       NOT NULL,
    [ConnectionManagerTypeDescription] VARCHAR (200)                                      NULL,
    [ValidFrom]                        DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [ValidTo]                          DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    CONSTRAINT [PK_ConnectionManagerType] PRIMARY KEY CLUSTERED ([ConnectionManagerTypeID] ASC),
    CONSTRAINT [UQ_ConnectionManagerType] UNIQUE NONCLUSTERED ([ConnectionManagerType] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Meta].[ConnectionManagerType_History], DATA_CONSISTENCY_CHECK=ON));

