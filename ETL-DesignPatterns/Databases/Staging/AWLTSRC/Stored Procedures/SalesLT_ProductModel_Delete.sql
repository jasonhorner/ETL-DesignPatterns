CREATE   PROCEDURE AWLTSRC.SalesLT_ProductModel_Delete
AS
BEGIN
    SET NOCOUNT ON;
    
    /* Soft Delete */
    UPDATE core
    SET [core].[Name] = [del].[Name]
,[core].[CatalogDescription] = [del].[CatalogDescription]
,[core].[rowguid] = [del].[rowguid]
,[core].[ModifiedDate] = [del].[ModifiedDate]
,[core].[ChangeHashKey] = [del].[ChangeHashKey]
,[core].[ChangeType] = [del].[ChangeType]
,[core].[IsDeleted] = [del].[IsDeleted]
,[core].[UpdateDate] = [del].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [del].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_ProductModel AS core
    INNER JOIN AWLTSRC.SalesLT_ProductModel_DEL AS del 
    ON [core].[ProductModelID] = [del].[ProductModelID]
    ;
    
    /* Hard Delete */
    /*
    DELETE FROM core
    FROM AWLTSRC.SalesLT_ProductModel AS core
    WHERE EXISTS (
        SELECT * 
        FROM AWLTSRC.SalesLT_ProductModel_DEL AS del 
        WHERE [core].[ProductModelID] = [del].[ProductModelID]
    );
    */
    
    RETURN 0;
END;