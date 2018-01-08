CREATE TABLE [ETL].[ChangeTrackingLatestVersion] (
    [DatabaseName] NCHAR (100) NULL,
    [TableName]    [sysname]   NOT NULL,
    [Version]      BIGINT      NULL,
    CONSTRAINT [PK_ChangeTrackingLatestVersion] PRIMARY KEY CLUSTERED ([TableName] ASC)
);

