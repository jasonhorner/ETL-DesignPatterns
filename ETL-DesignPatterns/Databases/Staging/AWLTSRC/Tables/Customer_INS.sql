CREATE TABLE [AWLTSRC].[Customer_INS](
	[CustomerId] [int] NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[CDCOperation] [char](1) NULL,
	[HashKey] NCHAR(40) NULL
 CONSTRAINT [PK_AWLTSRCCustomer_INS] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]