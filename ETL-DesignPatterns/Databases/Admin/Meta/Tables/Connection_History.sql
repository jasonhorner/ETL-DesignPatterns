CREATE TABLE [Meta].[Connection_History] (
    [ConnectionID]             INT            NOT NULL,
    [ConnectionName]           VARCHAR (50)   NOT NULL,
    [ConnectionDescription]    VARCHAR (1000) NULL,
    [ConnectionManagerTypeID]  SMALLINT       NOT NULL,
    [ConnectionString]         VARCHAR (200)  NOT NULL,
    [DatabaseName]             VARCHAR (50)   NULL,
    [SSISCreateInProject]      BIT            NULL,
    [SSISParameterize]         BIT            NULL,
    [SSISParameterIsRequired]  BIT            NULL,
    [SSISParameterIsSensitive] BIT            NULL,
    [ValidFrom]                DATETIME2 (7)  NOT NULL,
    [ValidTo]                  DATETIME2 (7)  NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_Connection_History]
    ON [Meta].[Connection_History]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

