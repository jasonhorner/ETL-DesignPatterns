CREATE TABLE [Meta].[Connection] (
    [ConnectionID]             INT                                                IDENTITY (1, 1) NOT NULL,
    [ConnectionName]           VARCHAR (50)                                       NOT NULL,
    [ConnectionDescription]    VARCHAR (1000)                                     NULL,
    [ConnectionManagerTypeID]  SMALLINT                                           NOT NULL,
    [ConnectionString]         VARCHAR (200)                                      NOT NULL,
    [ServerName]               VARCHAR (50)                                       NULL,
    [DatabaseName]             VARCHAR (50)                                       NULL,
    [SSISCreateInProject]      BIT                                                NULL,
    [SSISParameterize]         BIT                                                NULL,
    [SSISParameterIsRequired]  BIT                                                NULL,
    [SSISParameterIsSensitive] BIT                                                NULL,
    [ValidFrom]                DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [ValidTo]                  DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    CONSTRAINT [PK_Connection] PRIMARY KEY CLUSTERED ([ConnectionID] ASC),
    CONSTRAINT [FK_Connection_ConnectionManagerType] FOREIGN KEY ([ConnectionManagerTypeID]) REFERENCES [Meta].[ConnectionManagerType] ([ConnectionManagerTypeID]),
    CONSTRAINT [UQ_Connection] UNIQUE NONCLUSTERED ([ConnectionName] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Meta].[Connection_History], DATA_CONSISTENCY_CHECK=ON));



