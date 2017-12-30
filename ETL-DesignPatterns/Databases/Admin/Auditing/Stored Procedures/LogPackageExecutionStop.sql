
CREATE   PROCEDURE Auditing.LogPackageExecutionStop (
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