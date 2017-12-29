CREATE PROCEDURE [ETL].[SetChangeTrackingLatestVersion]
	@databaseName sysname, 
	@tableName sysname, 
	@versionId int output 

AS
BEGIN
    
	SET NOCOUNT ON

	MERGE [ETL].[ChangeTrackingLatestVersion] AS target
USING (
	    SELECT 
		 @databaseName AS DatabaseName
		,@tableName AS TableName
		,@VersionId As VersionId
) AS source
	ON  target.DatabaseName = source.DatabaseName AND target.TableName = source.TableName
WHEN MATCHED
THEN UPDATE 
SET target.[Version] = source.VersionId
WHEN NOT MATCHED
THEN INSERT (DatabaseName, TableName, [Version])
VALUES (source.DatabaseName, source.TableName, source.[VersionId]);

RETURN 0;

END