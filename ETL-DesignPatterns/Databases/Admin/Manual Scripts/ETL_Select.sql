USE Admin;
GO

SELECT * FROM ETL.ChangeTrackingLatestVersion; 

DECLARE @versionId INT;
EXECUTE ETL.GetChangeTrackingLatestVersion
    @databaseName = 'AdventureWorksLT'
   ,@tableName = 'dbo.Customer'
   ,@versionId = @versionId OUTPUT -- int
SELECT @versionId;