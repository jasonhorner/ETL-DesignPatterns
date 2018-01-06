CREATE   PROCEDURE AWLTSRC.SalesLT_ProductModelProductDescription_Update
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE core
    SET [core].[rowguid] = [upd].[rowguid]
,[core].[ModifiedDate] = [upd].[ModifiedDate]
,[core].[ChangeHashKey] = [upd].[ChangeHashKey]
,[core].[ChangeType] = [upd].[ChangeType]
,[core].[IsDeleted] = [upd].[IsDeleted]
,[core].[UpdateDate] = [upd].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [upd].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_ProductModelProductDescription AS core
    INNER JOIN AWLTSRC.SalesLT_ProductModelProductDescription_UPD AS upd 
    ON [core].[ProductModelID] = [upd].[ProductModelID]
AND [core].[ProductDescriptionID] = [upd].[ProductDescriptionID]
AND [core].[Culture] = [upd].[Culture]
    ;
    
    RETURN 0;
END;