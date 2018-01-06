CREATE   PROCEDURE AWLTSRC.SalesLT_ProductDescription_Update
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE core
    SET [core].[Description] = [upd].[Description]
,[core].[rowguid] = [upd].[rowguid]
,[core].[ModifiedDate] = [upd].[ModifiedDate]
,[core].[ChangeHashKey] = [upd].[ChangeHashKey]
,[core].[ChangeType] = [upd].[ChangeType]
,[core].[IsDeleted] = [upd].[IsDeleted]
,[core].[UpdateDate] = [upd].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [upd].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_ProductDescription AS core
    INNER JOIN AWLTSRC.SalesLT_ProductDescription_UPD AS upd 
    ON [core].[ProductDescriptionID] = [upd].[ProductDescriptionID]
    ;
    
    RETURN 0;
END;