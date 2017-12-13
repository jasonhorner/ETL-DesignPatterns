CREATE PROCEDURE [ETL].[GetChangeTrackingLatestVersion]
	@databaseName sysname, 
	@tableName sysname, 
	@versionId int output 

AS
BEGIN

	SELECT
	[Version] 
	FROM [ETL].[ChangeTrackingLatestVersion]
	WHERE TableName = @tableName;
	-- @DatabaseName = @DatabaseName

END