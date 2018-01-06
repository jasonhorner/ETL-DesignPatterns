CREATE   PROCEDURE AWLTSRC.SalesLT_ProductDescription_Delete
AS
BEGIN
    SET NOCOUNT ON;
    
    /* Soft Delete */
    UPDATE core
    SET [core].[Description] = [del].[Description]
,[core].[rowguid] = [del].[rowguid]
,[core].[ModifiedDate] = [del].[ModifiedDate]
,[core].[ChangeHashKey] = [del].[ChangeHashKey]
,[core].[ChangeType] = [del].[ChangeType]
,[core].[IsDeleted] = [del].[IsDeleted]
,[core].[UpdateDate] = [del].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [del].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_ProductDescription AS core
    INNER JOIN AWLTSRC.SalesLT_ProductDescription_DEL AS del 
    ON [core].[ProductDescriptionID] = [del].[ProductDescriptionID]
    ;
    
    /* Hard Delete */
    /*
    DELETE FROM core
    FROM AWLTSRC.SalesLT_ProductDescription AS core
    WHERE EXISTS (
        SELECT * 
        FROM AWLTSRC.SalesLT_ProductDescription_DEL AS del 
        WHERE [core].[ProductDescriptionID] = [del].[ProductDescriptionID]
    );
    */
    
    RETURN 0;
END;