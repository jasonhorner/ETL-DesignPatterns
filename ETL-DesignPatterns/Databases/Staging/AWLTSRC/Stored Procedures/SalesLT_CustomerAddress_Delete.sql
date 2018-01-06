CREATE   PROCEDURE AWLTSRC.SalesLT_CustomerAddress_Delete
AS
BEGIN
    SET NOCOUNT ON;
    
    /* Soft Delete */
    UPDATE core
    SET [core].[AddressType] = [del].[AddressType]
,[core].[rowguid] = [del].[rowguid]
,[core].[ModifiedDate] = [del].[ModifiedDate]
,[core].[ChangeHashKey] = [del].[ChangeHashKey]
,[core].[ChangeType] = [del].[ChangeType]
,[core].[IsDeleted] = [del].[IsDeleted]
,[core].[UpdateDate] = [del].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [del].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_CustomerAddress AS core
    INNER JOIN AWLTSRC.SalesLT_CustomerAddress_DEL AS del 
    ON [core].[CustomerID] = [del].[CustomerID]
AND [core].[AddressID] = [del].[AddressID]
    ;
    
    /* Hard Delete */
    /*
    DELETE FROM core
    FROM AWLTSRC.SalesLT_CustomerAddress AS core
    WHERE EXISTS (
        SELECT * 
        FROM AWLTSRC.SalesLT_CustomerAddress_DEL AS del 
        WHERE [core].[CustomerID] = [del].[CustomerID]
AND [core].[AddressID] = [del].[AddressID]
    );
    */
    
    RETURN 0;
END;