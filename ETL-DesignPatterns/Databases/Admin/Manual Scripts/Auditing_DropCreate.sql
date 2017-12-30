USE Admin;
GO

/* --------------------------------------------------
-- Create Schemas
-------------------------------------------------- */
DECLARE @query nvarchar(4000);
SET @query = 'CREATE SCHEMA [Auditing] AUTHORIZATION [dbo];';
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Auditing')
EXEC(@query);
GO



/* --------------------------------------------------
-- Cleanup
-------------------------------------------------- */
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Auditing.LogPackageError') AND type IN (N'P'))
	DROP PROCEDURE Auditing.LogPackageError;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Auditing.LogPackageExecutionError') AND type IN (N'P'))
	DROP PROCEDURE Auditing.LogPackageExecutionError;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Auditing.LogPackageExecutionStart') AND type IN (N'P'))
	DROP PROCEDURE Auditing.LogPackageExecutionStart;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Auditing.LogPackageExecutionStop') AND type IN (N'P'))
	DROP PROCEDURE Auditing.LogPackageExecutionStop;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Auditing.PackageError') AND type IN (N'U'))
	DROP TABLE Auditing.PackageError;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Auditing.PackageExecution') AND type IN (N'U'))
	DROP TABLE Auditing.PackageExecution;
GO



/* --------------------------------------------------
-- Create Tables
-------------------------------------------------- */
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Auditing.PackageError') AND type IN (N'U'))
BEGIN
	CREATE TABLE Auditing.PackageError (
		PackageErrorID INT IDENTITY(1, 1) NOT NULL
	   ,PackageExecutionID INT NOT NULL
	   ,PackageID UNIQUEIDENTIFIER NOT NULL
	   ,PackageName NVARCHAR(255) NOT NULL
	   ,ServerExecutionID BIGINT NOT NULL
	   ,PackageErrorTime DATETIME2(7) NOT NULL
	   ,ErrorCode INT NOT NULL
	   ,ErrorDescription NVARCHAR(MAX) NOT NULL
	) ON [PRIMARY];
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Auditing.PackageExecution') AND type IN (N'U'))
BEGIN
	CREATE TABLE Auditing.PackageExecution (
		PackageExecutionID INT IDENTITY(1, 1) NOT NULL
	   ,PackageID UNIQUEIDENTIFIER NOT NULL
	   ,PackageName NVARCHAR(255) NOT NULL
	   ,ParentPackageID UNIQUEIDENTIFIER NULL
	   ,ParentPackageName NVARCHAR(255) NULL
	   ,ServerExecutionID BIGINT NOT NULL
	   ,PackageStartTime DATETIME2(7) NOT NULL
	   ,PackageStopTime DATETIME2(7) NULL
	   ,PackageDurationSeconds AS (DATEDIFF(SECOND, PackageStartTime, PackageStopTime))
	   ,PackageDurationMinutes AS (DATEDIFF(MINUTE, PackageStartTime, PackageStopTime))
	   ,ExecutionStatus VARCHAR(10) NOT NULL
	   ,SelectRowCount INT NULL
	   ,InsertRowCount INT NULL
	   ,UpdateRowCount INT NULL
	   ,DeleteRowCount INT NULL
	   ,IgnoreRowCount INT NULL
	   ,ErrorRowCount INT NULL
	) ON [PRIMARY];
END
GO

/* --------------------------------------------------
-- Create Procedures
-------------------------------------------------- */
CREATE OR ALTER PROCEDURE Auditing.LogPackageError (
    @PackageExecutionID INT
   ,@PackageID UNIQUEIDENTIFIER
   ,@PackageName NVARCHAR(255)
   ,@ServerExecutionID BIGINT
   ,@ErrorCode INT
   ,@ErrorDescription NVARCHAR(MAX)
)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Auditing.PackageError (
        PackageExecutionID
       ,PackageID
       ,PackageName
       ,ServerExecutionID
       ,PackageErrorTime
       ,ErrorCode
       ,ErrorDescription
    )
    SELECT
        @PackageExecutionID
       ,@PackageID
       ,@PackageName
       ,@ServerExecutionID
       ,SYSDATETIME()
       ,@ErrorCode
       ,@ErrorDescription;
END;
GO

CREATE OR ALTER PROCEDURE Auditing.LogPackageExecutionError (@PackageExecutionID INT)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Auditing.PackageExecution
    SET
        PackageStopTime = SYSDATETIME()
       ,ExecutionStatus = 'Failed'
    WHERE PackageExecutionID = @PackageExecutionID
        AND PackageStopTime IS NULL;
END;
GO

CREATE OR ALTER PROCEDURE Auditing.LogPackageExecutionStart (
    @PackageID UNIQUEIDENTIFIER
   ,@PackageName NVARCHAR(255)
   ,@ParentPackageID UNIQUEIDENTIFIER = NULL
   ,@ParentPackageName NVARCHAR(255) = NULL
   ,@ServerExecutionID BIGINT
   ,@PackageStartTime DATETIME2
)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @PackageExecutionID INT;
    INSERT INTO Auditing.PackageExecution (
        PackageID
       ,PackageName
       ,ParentPackageID
       ,ParentPackageName
       ,ServerExecutionID
       ,PackageStartTime
       ,ExecutionStatus
    )
    SELECT
        @PackageID
       ,@PackageName
       ,@ParentPackageID
       ,@ParentPackageName
       ,@ServerExecutionID
       ,@PackageStartTime
       ,'Running';
    SELECT @PackageExecutionID = SCOPE_IDENTITY();
    SELECT @PackageExecutionID AS PackageExecutionID;
END;
GO

CREATE OR ALTER PROCEDURE Auditing.LogPackageExecutionStop (
    @PackageExecutionID INT
   ,@SelectRowCount INT = NULL
   ,@InsertRowCount INT = NULL
   ,@UpdateRowCount INT = NULL
   ,@DeleteRowCount INT = NULL
   ,@IgnoreRowCount INT = NULL
   ,@ErrorRowCount INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Auditing.PackageExecution
    SET
        PackageStopTime = SYSDATETIME()
       ,ExecutionStatus = 'Completed'
       ,SelectRowCount = @SelectRowCount
       ,InsertRowCount = @InsertRowCount
       ,UpdateRowCount = @UpdateRowCount
       ,DeleteRowCount = @DeleteRowCount
       ,IgnoreRowCount = @IgnoreRowCount
       ,ErrorRowCount = @ErrorRowCount
    WHERE PackageExecutionID = @PackageExecutionID
    AND PackageStopTime IS NULL;
END;
GO