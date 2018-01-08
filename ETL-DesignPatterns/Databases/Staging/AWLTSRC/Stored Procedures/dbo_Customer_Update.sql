
/* UPDATE */
CREATE   PROCEDURE AWLTSRC.dbo_Customer_Update
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE core
    SET [core].[FirstName] = [upd].[FirstName]
,[core].[LastName] = [upd].[LastName]
,[core].[EmailAddress] = [upd].[EmailAddress]
,[core].[ChangeHashKey] = [upd].[ChangeHashKey]
,[core].[ChangeType] = [upd].[ChangeType]
,[core].[IsDeleted] = [upd].[IsDeleted]
,[core].[UpdateDate] = [upd].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [upd].[UpdatePackageExecutionID]
    FROM AWLTSRC.dbo_Customer AS core
    INNER JOIN AWLTSRC.dbo_Customer_UPD AS upd 
    ON [core].[CustomerID] = [upd].[CustomerID]
    ;
    
    RETURN 0;
END;