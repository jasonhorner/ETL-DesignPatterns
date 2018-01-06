CREATE   PROCEDURE AWLTSRC.SalesLT_ProductModel_Update
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE core
    SET [core].[Name] = [upd].[Name]
,[core].[CatalogDescription] = [upd].[CatalogDescription]
,[core].[rowguid] = [upd].[rowguid]
,[core].[ModifiedDate] = [upd].[ModifiedDate]
,[core].[ChangeHashKey] = [upd].[ChangeHashKey]
,[core].[ChangeType] = [upd].[ChangeType]
,[core].[IsDeleted] = [upd].[IsDeleted]
,[core].[UpdateDate] = [upd].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [upd].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_ProductModel AS core
    INNER JOIN AWLTSRC.SalesLT_ProductModel_UPD AS upd 
    ON [core].[ProductModelID] = [upd].[ProductModelID]
    ;
    
    RETURN 0;
END;