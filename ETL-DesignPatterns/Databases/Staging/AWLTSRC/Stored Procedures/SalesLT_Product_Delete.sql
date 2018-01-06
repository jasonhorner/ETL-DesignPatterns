CREATE   PROCEDURE AWLTSRC.SalesLT_Product_Delete
AS
BEGIN
    SET NOCOUNT ON;
    
    /* Soft Delete */
    UPDATE core
    SET [core].[Name] = [del].[Name]
,[core].[ProductNumber] = [del].[ProductNumber]
,[core].[Color] = [del].[Color]
,[core].[StandardCost] = [del].[StandardCost]
,[core].[ListPrice] = [del].[ListPrice]
,[core].[Size] = [del].[Size]
,[core].[Weight] = [del].[Weight]
,[core].[ProductCategoryID] = [del].[ProductCategoryID]
,[core].[ProductModelID] = [del].[ProductModelID]
,[core].[SellStartDate] = [del].[SellStartDate]
,[core].[SellEndDate] = [del].[SellEndDate]
,[core].[DiscontinuedDate] = [del].[DiscontinuedDate]
,[core].[ThumbNailPhoto] = [del].[ThumbNailPhoto]
,[core].[ThumbnailPhotoFileName] = [del].[ThumbnailPhotoFileName]
,[core].[rowguid] = [del].[rowguid]
,[core].[ModifiedDate] = [del].[ModifiedDate]
,[core].[ChangeHashKey] = [del].[ChangeHashKey]
,[core].[ChangeType] = [del].[ChangeType]
,[core].[IsDeleted] = [del].[IsDeleted]
,[core].[UpdateDate] = [del].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [del].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_Product AS core
    INNER JOIN AWLTSRC.SalesLT_Product_DEL AS del 
    ON [core].[ProductID] = [del].[ProductID]
    ;
    
    /* Hard Delete */
    /*
    DELETE FROM core
    FROM AWLTSRC.SalesLT_Product AS core
    WHERE EXISTS (
        SELECT * 
        FROM AWLTSRC.SalesLT_Product_DEL AS del 
        WHERE [core].[ProductID] = [del].[ProductID]
    );
    */
    
    RETURN 0;
END;