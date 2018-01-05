
/* --------------------------------------------------
-- Create Procedures
-------------------------------------------------- */
CREATE   PROCEDURE Auditing.LogPackageError (
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