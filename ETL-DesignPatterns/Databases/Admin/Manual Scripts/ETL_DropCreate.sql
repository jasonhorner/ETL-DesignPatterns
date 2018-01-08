USE Admin;
GO

/* --------------------------------------------------
-- Create Schemas
-------------------------------------------------- */
DECLARE @query nvarchar(4000);
SET @query = 'CREATE SCHEMA [ETL] AUTHORIZATION [dbo];';
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'ETL')
EXEC(@query);
GO



/* --------------------------------------------------
-- Cleanup
-------------------------------------------------- */
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'ETL.GetChangeTrackingLatestVersion') AND type IN (N'P'))
	DROP PROCEDURE ETL.SetChangeTrackingLatestVersion;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'ETL.SetChangeTrackingLatestVersion') AND type IN (N'P'))
	DROP PROCEDURE ETL.SetChangeTrackingLatestVersion;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'ETL.ChangeTrackingLatestVersion') AND type IN (N'U'))
	DROP TABLE ETL.ChangeTrackingLatestVersion;
GO



/* --------------------------------------------------
-- Create Tables
-------------------------------------------------- */
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'ETL.ChangeTrackingLatestVersion') AND type IN (N'U'))
	BEGIN
		CREATE TABLE ETL.ChangeTrackingLatestVersion (
			DatabaseName NCHAR(100) NULL
		   ,TableName SYSNAME NOT NULL
		   ,Version BIGINT NULL
		   ,CONSTRAINT PK_ChangeTrackingLatestVersion PRIMARY KEY CLUSTERED (TableName ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		) ON [PRIMARY];
	END;
GO



/* --------------------------------------------------
-- Create Procedures
-------------------------------------------------- */
CREATE OR ALTER PROCEDURE ETL.GetChangeTrackingLatestVersion
    @databaseName SYSNAME
   ,@tableName SYSNAME
   ,@versionId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

	IF EXISTS (SELECT * FROM ETL.ChangeTrackingLatestVersion) 
	BEGIN
		SELECT @versionId = Version
		FROM ETL.ChangeTrackingLatestVersion
		WHERE TableName = @tableName
			AND @databaseName = @databaseName;
	END;
	IF NOT EXISTS (SELECT * FROM ETL.ChangeTrackingLatestVersion) 
	BEGIN
		SELECT @versionId = 0;
	END;

    RETURN 0;
END;
GO

CREATE OR ALTER PROCEDURE ETL.SetChangeTrackingLatestVersion
    @databaseName SYSNAME
   ,@tableName SYSNAME
   ,@versionId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    MERGE ETL.ChangeTrackingLatestVersion AS target
    USING (SELECT @databaseName AS DatabaseName, @tableName AS TableName, @versionId AS VersionId) AS source
    ON target.DatabaseName = source.DatabaseName 
		AND target.TableName = source.TableName
    WHEN MATCHED 
		THEN UPDATE SET target.Version = source.VersionId
    WHEN NOT MATCHED 
		THEN INSERT (DatabaseName, TableName, Version) VALUES (source.DatabaseName, source.TableName, source.VersionId)
	;

    RETURN 0;
END;
GO