
CREATE   PROCEDURE Auditing.LogPackageExecutionStart (
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