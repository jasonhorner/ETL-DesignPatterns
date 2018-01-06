CREATE   PROCEDURE AWLTSRC.SalesLT_ProductCategory_Update
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE core
    SET [core].[ParentProductCategoryID] = [upd].[ParentProductCategoryID]
,[core].[Name] = [upd].[Name]
,[core].[rowguid] = [upd].[rowguid]
,[core].[ModifiedDate] = [upd].[ModifiedDate]
,[core].[ChangeHashKey] = [upd].[ChangeHashKey]
,[core].[ChangeType] = [upd].[ChangeType]
,[core].[IsDeleted] = [upd].[IsDeleted]
,[core].[UpdateDate] = [upd].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [upd].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_ProductCategory AS core
    INNER JOIN AWLTSRC.SalesLT_ProductCategory_UPD AS upd 
    ON [core].[ProductCategoryID] = [upd].[ProductCategoryID]
    ;
    
    RETURN 0;
END;