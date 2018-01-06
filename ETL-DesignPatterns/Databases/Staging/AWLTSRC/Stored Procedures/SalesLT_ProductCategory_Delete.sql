CREATE   PROCEDURE AWLTSRC.SalesLT_ProductCategory_Delete
AS
BEGIN
    SET NOCOUNT ON;
    
    /* Soft Delete */
    UPDATE core
    SET [core].[ParentProductCategoryID] = [del].[ParentProductCategoryID]
,[core].[Name] = [del].[Name]
,[core].[rowguid] = [del].[rowguid]
,[core].[ModifiedDate] = [del].[ModifiedDate]
,[core].[ChangeHashKey] = [del].[ChangeHashKey]
,[core].[ChangeType] = [del].[ChangeType]
,[core].[IsDeleted] = [del].[IsDeleted]
,[core].[UpdateDate] = [del].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [del].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_ProductCategory AS core
    INNER JOIN AWLTSRC.SalesLT_ProductCategory_DEL AS del 
    ON [core].[ProductCategoryID] = [del].[ProductCategoryID]
    ;
    
    /* Hard Delete */
    /*
    DELETE FROM core
    FROM AWLTSRC.SalesLT_ProductCategory AS core
    WHERE EXISTS (
        SELECT * 
        FROM AWLTSRC.SalesLT_ProductCategory_DEL AS del 
        WHERE [core].[ProductCategoryID] = [del].[ProductCategoryID]
    );
    */
    
    RETURN 0;
END;