USE AdventureWorksLT;
GO

/* --------------------------------------------------
-- Reset before CT demo
-------------------------------------------------- */
IF EXISTS (SELECT * FROM Admin.sys.objects WHERE object_id = OBJECT_ID(N'Admin.ETL.ChangeTrackingLatestVersion') AND type IN (N'U'))
	TRUNCATE TABLE Admin.ETL.ChangeTrackingLatestVersion;
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

IF NOT EXISTS (SELECT * FROM sys.change_tracking_databases WHERE database_id = DB_ID('AdventureWorksLT'))
BEGIN
	
	-- Enable Change Tracking on Source Database
	ALTER DATABASE AdventureWorksLT SET CHANGE_TRACKING = ON (CHANGE_RETENTION = 7 DAYS, AUTO_CLEANUP = ON);
	
	-- Snapshot isolation is recomended to simpilify the process of getting changed data
	ALTER DATABASE AdventureWorksLT SET ALLOW_SNAPSHOT_ISOLATION ON;

END;
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
	
	-- Enable Change Tracking on Source Table
	ALTER TABLE dbo.Customer ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = ON);

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

SELECT * FROM dbo.Customer;
SELECT * FROM CHANGETABLE(CHANGES dbo.Customer, NULL) AS ct;
SELECT * FROM Admin.ETL.ChangeTrackingLatestVersion;