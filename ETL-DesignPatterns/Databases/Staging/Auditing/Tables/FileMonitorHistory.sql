CREATE TABLE [Auditing].[FileMonitorHistory] (
    [ID]                   INT             IDENTITY (1, 1) NOT NULL,
    [Tablename]            [sysname]       NOT NULL,
    [Schemaname]           [sysname]       NOT NULL,
    [HoursSinceLastImport] NUMERIC (17, 6) NULL,
    [RefreshRequirement]   INT             NULL,
    [ErrorDate]            DATETIME        CONSTRAINT [DF_AuditingFileMonitorHistory_ErrorDate] DEFAULT (getdate()) NOT NULL
);

