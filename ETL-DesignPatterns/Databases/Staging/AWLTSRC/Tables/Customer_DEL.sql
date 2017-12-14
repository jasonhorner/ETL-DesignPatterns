CREATE TABLE [AWLTSRC].[Customer_DEL](
	[CustomerId] [int] NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[CDCOperation] [char](1) NULL
 CONSTRAINT [PK_AWLTSRCCustomer_DEL] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]