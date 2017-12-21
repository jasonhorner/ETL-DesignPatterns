

CREATE PROCEDURE [Auditing].[LogPackageError] (
	@PackageExecutionID INT
	,@PackageID UNIQUEIDENTIFIER
	,@PackageName NVARCHAR(255)
	,@ServerExecutionID BIGINT
	,@ErrorCode INT
	,@ErrorDescription NVARCHAR(MAX)
)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Auditing.PackageError (
		PackageExecutionID
		,PackageID
		,PackageName
		,ServerExecutionID
		,PackageErrorTime
		,ErrorCode
		,ErrorDescription
	)
	SELECT
		@PackageExecutionID
		,@PackageID
		,@PackageName
		,@ServerExecutionID
		,SYSDATETIME()
		,@ErrorCode
		,@ErrorDescription
END