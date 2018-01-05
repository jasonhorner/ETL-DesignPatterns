
CREATE   PROCEDURE Auditing.LogPackageExecutionStart (
    @ServerExecutionID INT
   ,@BatchID INT
   ,@JobID INT
   ,@PackageID NVARCHAR(255)
   ,@PackageName NVARCHAR(255)
   ,@ParentPackageID NVARCHAR(255)
   ,@ParentPackageName NVARCHAR(255)
   ,@PackageStartTime DATETIME2
)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @PackageExecutionID INT;
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
       ,'Running';
    SELECT @PackageExecutionID = SCOPE_IDENTITY();
    SELECT @PackageExecutionID AS PackageExecutionID;
END;