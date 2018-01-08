USE AdventureWorksLT;
GO

/* --------------------------------------------------
-- Reset before CDC demo
-------------------------------------------------- */
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AdventureWorksLT' AND is_cdc_enabled = 1)
BEGIN
	-- Enable Change Data Capture on Source Database
	EXEC sys.sp_cdc_enable_db;
END;
GO

IF EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID('dbo.Customer') AND is_tracked_by_cdc = 1)
BEGIN
	-- Disable Change Data Capture on Source Table
	EXEC sys.sp_cdc_disable_table
	    @source_schema = 'dbo'
	   ,@source_name = 'Customer'
	   ,@capture_instance = 'dbo_Customer_ETL_CDC';
END;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Customer') AND type IN (N'U'))
	DROP TABLE dbo.Customer;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Customer_STG') AND type IN (N'U'))
	DROP TABLE dbo.Customer_STG;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Customer_INS') AND type IN (N'U'))
	DROP TABLE dbo.Customer_INS;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Customer_UPD') AND type IN (N'U'))
	DROP TABLE dbo.Customer_UPD;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Customer_DEL') AND type IN (N'U'))
	DROP TABLE dbo.Customer_DEL;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Customer') AND type IN (N'U'))
BEGIN
	CREATE TABLE dbo.Customer (
		CustomerID INT IDENTITY(1, 1) NOT NULL
	   ,FirstName dbo.Name NOT NULL
	   ,LastName dbo.Name NOT NULL
	   ,EmailAddress NVARCHAR(50) NULL
	   ,CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED (CustomerID ASC)
	) ON [PRIMARY];

	INSERT INTO dbo.Customer (
		Firstname
	   ,LastName
	   ,EmailAddress
	)
	SELECT TOP (10)
		FirstName
		,LastName
		,EmailAddress
	FROM SalesLT.Customer;

END;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID('dbo.Customer') AND is_tracked_by_cdc = 1)
BEGIN
	-- Enable Change Data Capture on Source Table
	EXEC sys.sp_cdc_enable_table
	    @source_schema = 'dbo'
	   ,@source_name = 'Customer'
	   ,@capture_instance = 'dbo_Customer_ETL_CDC'
	   ,@supports_net_changes = 1
	   ,@role_name = NULL;
END;
GO

SELECT * FROM dbo.Customer;

EXEC sys.sp_cdc_help_change_data_capture @source_schema = 'dbo', @source_name = 'Customer';
 