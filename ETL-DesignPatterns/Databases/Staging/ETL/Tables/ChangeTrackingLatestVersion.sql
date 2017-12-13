CREATE TABLE [ETL].[ChangeTrackingLatestVersion](
	[TableName] [sysname] NOT NULL,
	[DatabaseName] [nchar](10) NULL,
	[Version] [bigint] NULL,
 CONSTRAINT [PK__ChangeTr__733652EF9F1BB1EB] PRIMARY KEY CLUSTERED 
(
	[TableName] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]