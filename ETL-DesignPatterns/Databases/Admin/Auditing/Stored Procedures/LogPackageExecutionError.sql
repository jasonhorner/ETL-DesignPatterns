CREATE PROCEDURE Auditing.LogPackageExecutionError (@PackageExecutionID INT)
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