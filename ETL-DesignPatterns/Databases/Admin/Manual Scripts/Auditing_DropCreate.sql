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

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Auditing.FlatFileError') AND type IN (N'U'))
	DROP TABLE Auditing.FlatFileError;
GO



/* --------------------------------------------------
-- Create Tables
-------------------------------------------------- */
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Auditing.PackageError') AND type IN (N'U'))
BEGIN
	CREATE TABLE Auditing.PackageError (
		PackageErrorID INT IDENTITY(1, 1) NOT NULL
	   ,PackageExecutionID INT NOT NULL
	   ,ServerExecutionID INT NOT NULL
	   ,BatchID INT NOT NULL
	   ,JobID INT NOT NULL
	   ,PackageID NVARCHAR(255) NOT NULL
	   ,PackageName NVARCHAR(255) NOT NULL
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
	   ,ServerExecutionID INT NOT NULL
	   ,BatchID INT NOT NULL
	   ,JobID INT NOT NULL
	   ,PackageID NVARCHAR(255) NOT NULL
	   ,PackageName NVARCHAR(255) NOT NULL
	   ,ParentPackageID NVARCHAR(255) NULL
	   ,ParentPackageName NVARCHAR(255) NULL
	   ,PackageStartTime DATETIME2(7) NOT NULL
	   ,PackageStopTime DATETIME2(7) NULL
	   ,PackageDurationSeconds AS (DATEDIFF(SECOND, PackageStartTime, PackageStopTime))
	   ,PackageDurationMinutes AS (DATEDIFF(SECOND, PackageStartTime, PackageStopTime))/60
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

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Auditing.FlatFileError') AND type in (N'U'))
BEGIN
    CREATE TABLE Auditing.FlatFileError (
        FlatFileErrorID INT IDENTITY(1, 1) NOT NULL
       ,PackageName NVARCHAR(255) NOT NULL
       ,TaskName NVARCHAR(255) NOT NULL
       ,ErrorDate DATETIME NOT NULL
       ,ErrorCode INT NOT NULL
       ,ErrorColumn INT NOT NULL
       ,ErrorRow NVARCHAR(MAX) NOT NULL
    );
END;
GO

/* --------------------------------------------------
-- Create Procedures
-------------------------------------------------- */
CREATE OR ALTER PROCEDURE Auditing.LogPackageError (
    @PackageExecutionID INT
   ,@ServerExecutionID INT
   ,@BatchID INT
   ,@JobID INT
   ,@PackageID NVARCHAR(255)
   ,@PackageName NVARCHAR(255)
   ,@ErrorCode INT
   ,@ErrorDescription NVARCHAR(MAX)
)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Auditing.PackageError (
        PackageExecutionID
       ,ServerExecutionID
	   ,BatchID
	   ,JobID
       ,PackageID
       ,PackageName
       ,PackageErrorTime
       ,ErrorCode
       ,ErrorDescription
    )
    SELECT
        @PackageExecutionID
       ,@ServerExecutionID
	   ,@BatchID
	   ,@JobID
       ,@PackageID
       ,@PackageName
       ,SYSDATETIME()
       ,@ErrorCode
       ,@ErrorDescription;
END;
GO

CREATE OR ALTER PROCEDURE Auditing.LogPackageExecutionError(@PackageExecutionID INT)
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
    @ServerExecutionID INT
   ,@BatchID INT
   ,@JobID INT
   ,@PackageID NVARCHAR(255)
   ,@PackageName NVARCHAR(255)
   ,@ParentPackageID NVARCHAR(255)
   ,@ParentPackageName NVARCHAR(255)
   ,@PackageStartTime DATETIME2
   ,@PackageExecutionID INT OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Auditing.PackageExecution (
       ServerExecutionID
       ,BatchID
	   ,JobID
	   ,PackageID
       ,PackageName
       ,ParentPackageID
       ,ParentPackageName
       ,PackageStartTime
       ,ExecutionStatus
    )
    SELECT
        @ServerExecutionID
       ,@BatchID
	   ,@JobID
	   ,@PackageID
       ,@PackageName
       ,@ParentPackageID
       ,@ParentPackageName
       ,@PackageStartTime
       ,'Running'
	;
    SELECT @PackageExecutionID = SCOPE_IDENTITY();
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