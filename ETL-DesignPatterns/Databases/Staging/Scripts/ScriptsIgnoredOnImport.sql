
/****** Object:  Table [ETL].[ChangeTrackingLatestVersion]    Script Date: 12/13/2017 7:55:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [ETL].[FlatFileErrors]    Script Date: 12/13/2017 7:55:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [ETL].[GetChangeTrackingLatestVersion]    Script Date: 12/13/2017 7:56:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [AWLTSTG].[CustomerMerge]    Script Date: 12/13/2017 7:56:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [AWLTSTG].[Customer]    Script Date: 12/13/2017 7:58:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [AWLTSRC].[Customer_STG](
	[CustomerId] [int] NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[CDCOperation] [char](1) NULL
 CONSTRAINT [PK_AWLTSRCCustomer_STG] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

--Syntax Error: Incorrect syntax near [CDCOperation].
--
--CREATE TABLE [AWLTSRC].[Customer_STG](
--	[CustomerId] [int] NOT NULL,
--	[Firstname] [nvarchar](50) NOT NULL,
--	[LastName] [nvarchar](50) NOT NULL,
--	[EmailAddress] [nvarchar](50) NULL,
--	[Excution_Id] bigint null
--	[CDCOperation] [char](1) NULL,
-- CONSTRAINT [PK_AWLTSRCCustomer_STG] PRIMARY KEY CLUSTERED 
--(
--	[CustomerId] ASC
--)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]



GO
