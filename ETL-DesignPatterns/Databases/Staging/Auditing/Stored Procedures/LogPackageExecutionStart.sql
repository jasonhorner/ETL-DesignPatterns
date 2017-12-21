
CREATE PROCEDURE [Auditing].[LogPackageExecutionStart] (
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
		,'Running'
	;
	SELECT @PackageExecutionID = SCOPE_IDENTITY();
	SELECT @PackageExecutionID AS PackageExecutionID;
END