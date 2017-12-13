CREATE TABLE [ETL].[FlatFileErrors](
	[FlatFileErrorID] [int] IDENTITY(1,1) NOT NULL,
	[PackageName] [nvarchar](255) NOT NULL,
	[TaskName] [nvarchar](255) NOT NULL,
	[ErrorDate] [datetime] NOT NULL,
	[ErrorCode] [int] NOT NULL,
	[ErrorColumn] [int] NOT NULL,
	[ErrorRow] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

