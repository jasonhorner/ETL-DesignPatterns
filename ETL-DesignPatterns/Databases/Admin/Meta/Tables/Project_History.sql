CREATE TABLE [Meta].[Project_History] (
    [ProjectID]               INT            NOT NULL,
    [ProjectName]             VARCHAR (50)   NOT NULL,
    [ProjectDescription]      VARCHAR (1000) NULL,
    [ProjectTypeID]           SMALLINT       NOT NULL,
    [SourceConnectionID]      INT            NOT NULL,
    [DestinationConnectionID] INT            NOT NULL,
    [DestinationSchemaName]   VARCHAR (10)   NULL,
    [ValidFrom]               DATETIME2 (7)  NOT NULL,
    [ValidTo]                 DATETIME2 (7)  NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_Project_History]
    ON [Meta].[Project_History]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

