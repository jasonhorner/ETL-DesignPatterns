CREATE TABLE [Auditing].[FileMonitorHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Tablename] [sysname] NOT NULL,
	[Schemaname] [sysname] NOT NULL,
	[HoursSinceLastImport] [numeric](17, 6) NULL,
	[RefreshRequirement] [int] NULL,
	[ErrorDate] [datetime] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [Auditing].[FileMonitorHistory] ADD  CONSTRAINT [DF_AuditingFileMonitorHistory_ErrorDate]  DEFAULT (getdate()) FOR [ErrorDate]
GO
