CREATE PROCEDURE [ETL].[GetChangeTrackingLatestVersion]
	@databaseName sysname, 
	@tableName sysname, 
	@versionId int output 

AS
BEGIN

	SELECT
	@VersionId = [Version] 
	FROM [ETL].[ChangeTrackingLatestVersion]
	WHERE TableName = @tableName
    AND  @DatabaseName = @DatabaseName;

	RETURN 0;

END