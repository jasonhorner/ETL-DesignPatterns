


/* --------------------------------------------------
-- Create Procedures
-------------------------------------------------- */
CREATE   PROCEDURE ETL.GetChangeTrackingLatestVersion
    @databaseName SYSNAME
   ,@tableName SYSNAME
   ,@versionId INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

	IF EXISTS (SELECT * FROM ETL.ChangeTrackingLatestVersion) 
	BEGIN
		SELECT @versionId = Version
		FROM ETL.ChangeTrackingLatestVersion
		WHERE TableName = @tableName
			AND @databaseName = @databaseName;
	END;
	IF NOT EXISTS (SELECT * FROM ETL.ChangeTrackingLatestVersion) 
	BEGIN
		SELECT @versionId = 0;
	END;

    RETURN 0;
END;