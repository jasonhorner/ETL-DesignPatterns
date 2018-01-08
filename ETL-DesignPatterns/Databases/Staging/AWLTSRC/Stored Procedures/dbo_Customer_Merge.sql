
-------------------------------------------------------------------








/* MERGE */
CREATE   PROCEDURE AWLTSRC.dbo_Customer_Merge
AS
BEGIN
    SET NOCOUNT ON;
    
    MERGE AWLTSRC.dbo_Customer AS core
    USING (SELECT [CustomerID], [FirstName], [LastName], [EmailAddress], [ChangeHashKey], [ChangeType], [IsDeleted], [UpdateDate], [UpdatePackageExecutionID] FROM AWLTSRC.dbo_Customer_STG) AS stg
    ON [core].[CustomerID] = [stg].[CustomerID]
    WHEN NOT MATCHED
        THEN INSERT ([FirstName], [LastName], [EmailAddress], [ChangeHashKey], [ChangeType], [IsDeleted], [UpdateDate], [UpdatePackageExecutionID])
        VALUES ([stg].[FirstName], [stg].[LastName], [stg].[EmailAddress], [stg].[ChangeHashKey], [stg].[ChangeType], [stg].[IsDeleted], [stg].[UpdateDate], [stg].[UpdatePackageExecutionID])
    WHEN MATCHED AND stg.ChangeType = 'U'
        THEN UPDATE SET
        [core].[FirstName] = [stg].[FirstName]
,[core].[LastName] = [stg].[LastName]
,[core].[EmailAddress] = [stg].[EmailAddress]
,[core].[ChangeHashKey] = [stg].[ChangeHashKey]
,[core].[ChangeType] = [stg].[ChangeType]
,[core].[IsDeleted] = [stg].[IsDeleted]
,[core].[UpdateDate] = [stg].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [stg].[UpdatePackageExecutionID]
	WHEN MATCHED AND stg.ChangeType = 'D'
        THEN DELETE
    ;
    
    RETURN 0;
END;