CREATE PROCEDURE [ETL].[GetChangeTrackingLatestVersion]
	@databaseName sysname, 
	@tableName sysname, 
	@versionId int output 

AS
BEGIN

	SELECT
	@versionId = [Version] 
	FROM [ETL].[ChangeTrackingLatestVersion]
	WHERE TableName = @tableName
    AND  @databaseName = @DatabaseName;

	RETURN 0;

END