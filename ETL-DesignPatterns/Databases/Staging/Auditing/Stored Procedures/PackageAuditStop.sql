


--DROP PROCEDURE IF EXISTS Auditing.PackageAuditStop;
CREATE   PROCEDURE Auditing.PackageAuditStop (
	@PackageAuditID INT
	,@SourceRowCount INT = NULL
	,@NewRowCount INT = NULL
	,@ChangedRowCount INT = NULL
	,@ExistingRowCount INT = NULL
	,@DeletedRowCount INT = NULL
	,@SCD1RowCount INT = NULL
	,@SCD2RowCount INT = NULL
	,@FlatFileErrorsRowCount INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE etl.PackageAudit SET
		PackageStopTime = SYSDATETIME()
		,SourceRowCount = @SourceRowCount
		,NewRowCount = @NewRowCount
		,ChangedRowCount = @ChangedRowCount
		,ExistingRowCount = @ExistingRowCount
		,DeletedRowCount = @DeletedRowCount
		,FlatFileErrorsRowCount = @FlatFileErrorsRowCount
	WHERE PackageAuditID = @PackageAuditID
	AND PackageStopTime IS NULL;
END
