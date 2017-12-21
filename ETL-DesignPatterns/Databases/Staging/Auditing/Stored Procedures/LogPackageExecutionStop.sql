
CREATE PROCEDURE [Auditing].[LogPackageExecutionStop] (
	@PackageExecutionID INT
	,@SourceRowCount INT = NULL
	,@NewRowCount INT = NULL
	,@ChangedRowCount INT = NULL
	,@ExistingRowCount INT = NULL
	,@DeletedRowCount INT = NULL
	,@FlatFileErrorsRowCount INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Auditing.PackageExecution SET
		PackageStopTime = SYSDATETIME()
		,ExecutionStatus = 'Completed'
		,SourceRowCount = @SourceRowCount
		,NewRowCount = @NewRowCount
		,ChangedRowCount = @ChangedRowCount
		,ExistingRowCount = @ExistingRowCount
		,DeletedRowCount = @DeletedRowCount
		,FlatFileErrorsRowCount = @FlatFileErrorsRowCount
	WHERE PackageExecutionID = @PackageExecutionID
	AND PackageStopTime IS NULL;
END