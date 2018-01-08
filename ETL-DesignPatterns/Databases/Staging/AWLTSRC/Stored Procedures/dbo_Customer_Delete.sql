
-------------------------------------------------------------------








/* Create Destination Procedures */
/* DELETE */
CREATE   PROCEDURE AWLTSRC.dbo_Customer_Delete
AS
BEGIN
    SET NOCOUNT ON;
    
    /* Soft Delete */
    UPDATE core
    SET [core].[FirstName] = [del].[FirstName]
,[core].[LastName] = [del].[LastName]
,[core].[EmailAddress] = [del].[EmailAddress]
,[core].[ChangeHashKey] = [del].[ChangeHashKey]
,[core].[ChangeType] = [del].[ChangeType]
,[core].[IsDeleted] = [del].[IsDeleted]
,[core].[UpdateDate] = [del].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [del].[UpdatePackageExecutionID]
    FROM AWLTSRC.dbo_Customer AS core
    INNER JOIN AWLTSRC.dbo_Customer_DEL AS del 
    ON [core].[CustomerID] = [del].[CustomerID]
    ;
    
    /* Hard Delete */
    /*
    DELETE FROM core
    FROM AWLTSRC.dbo_Customer AS core
    WHERE EXISTS (
        SELECT * 
        FROM AWLTSRC.dbo_Customer_DEL AS del 
        WHERE [core].[CustomerID] = [del].[CustomerID]
    );
    */
    
    RETURN 0;
END;