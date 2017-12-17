
--DROP PROCEDURE IF EXISTS Auditing.PackageAuditStart;
CREATE PROCEDURE Auditing.PackageAuditStart (
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
	DECLARE @PackageAuditID INT;
	INSERT INTO Auditing.PackageAudit (
		PackageID
		,PackageName
		,ParentPackageID
		,ParentPackageName
		,ServerExecutionID
		,PackageStartTime
	)
	SELECT
		@PackageID
		,@PackageName
		,@ParentPackageID
		,@ParentPackageName
		,@ServerExecutionID
		,@PackageStartTime;
	SELECT @PackageAuditID = SCOPE_IDENTITY();
	SELECT @PackageAuditID AS PackageAuditID;
END
