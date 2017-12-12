CREATE TABLE [ETL].[FlatFileErrors] (
    [FlatFileErrorID] INT            IDENTITY (1, 1) NOT NULL,
    [PackageName]     NVARCHAR (255) NOT NULL,
    [TaskName]        NVARCHAR (255) NOT NULL,
    [ErrorDate]       DATETIME       NOT NULL,
    [ErrorCode]       INT            NOT NULL,
    [ErrorColumn]     INT            NOT NULL,
    [ErrorRow]        NVARCHAR (MAX) NOT NULL
);

