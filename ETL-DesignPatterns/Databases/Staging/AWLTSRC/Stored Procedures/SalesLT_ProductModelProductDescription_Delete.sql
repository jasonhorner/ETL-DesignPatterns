CREATE   PROCEDURE AWLTSRC.SalesLT_ProductModelProductDescription_Delete
AS
BEGIN
    SET NOCOUNT ON;
    
    /* Soft Delete */
    UPDATE core
    SET [core].[rowguid] = [del].[rowguid]
,[core].[ModifiedDate] = [del].[ModifiedDate]
,[core].[ChangeHashKey] = [del].[ChangeHashKey]
,[core].[ChangeType] = [del].[ChangeType]
,[core].[IsDeleted] = [del].[IsDeleted]
,[core].[UpdateDate] = [del].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [del].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_ProductModelProductDescription AS core
    INNER JOIN AWLTSRC.SalesLT_ProductModelProductDescription_DEL AS del 
    ON [core].[ProductModelID] = [del].[ProductModelID]
AND [core].[ProductDescriptionID] = [del].[ProductDescriptionID]
AND [core].[Culture] = [del].[Culture]
    ;
    
    /* Hard Delete */
    /*
    DELETE FROM core
    FROM AWLTSRC.SalesLT_ProductModelProductDescription AS core
    WHERE EXISTS (
        SELECT * 
        FROM AWLTSRC.SalesLT_ProductModelProductDescription_DEL AS del 
        WHERE [core].[ProductModelID] = [del].[ProductModelID]
AND [core].[ProductDescriptionID] = [del].[ProductDescriptionID]
AND [core].[Culture] = [del].[Culture]
    );
    */
    
    RETURN 0;
END;