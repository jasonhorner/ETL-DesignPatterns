CREATE TABLE [Meta].[Project] (
    [ProjectID]               INT                                                IDENTITY (1, 1) NOT NULL,
    [ProjectName]             VARCHAR (50)                                       NOT NULL,
    [ProjectDescription]      VARCHAR (1000)                                     NULL,
    [ProjectTypeID]           SMALLINT                                           NOT NULL,
    [SourceConnectionID]      INT                                                NOT NULL,
    [DestinationConnectionID] INT                                                NOT NULL,
    [DestinationSchemaName]   VARCHAR (10)                                       NULL,
    [ValidFrom]               DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [ValidTo]                 DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED ([ProjectID] ASC),
    CONSTRAINT [FK_Project_DestinationConnection] FOREIGN KEY ([DestinationConnectionID]) REFERENCES [Meta].[Connection] ([ConnectionID]),
    CONSTRAINT [FK_Project_ProjectType] FOREIGN KEY ([ProjectTypeID]) REFERENCES [Meta].[ProjectType] ([ProjectTypeID]),
    CONSTRAINT [FK_Project_SourceConnection] FOREIGN KEY ([SourceConnectionID]) REFERENCES [Meta].[Connection] ([ConnectionID]),
    CONSTRAINT [UQ_Project] UNIQUE NONCLUSTERED ([ProjectName] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Meta].[Project_History], DATA_CONSISTENCY_CHECK=ON));

