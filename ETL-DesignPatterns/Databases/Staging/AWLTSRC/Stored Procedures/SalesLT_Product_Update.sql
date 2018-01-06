CREATE   PROCEDURE AWLTSRC.SalesLT_Product_Update
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE core
    SET [core].[Name] = [upd].[Name]
,[core].[ProductNumber] = [upd].[ProductNumber]
,[core].[Color] = [upd].[Color]
,[core].[StandardCost] = [upd].[StandardCost]
,[core].[ListPrice] = [upd].[ListPrice]
,[core].[Size] = [upd].[Size]
,[core].[Weight] = [upd].[Weight]
,[core].[ProductCategoryID] = [upd].[ProductCategoryID]
,[core].[ProductModelID] = [upd].[ProductModelID]
,[core].[SellStartDate] = [upd].[SellStartDate]
,[core].[SellEndDate] = [upd].[SellEndDate]
,[core].[DiscontinuedDate] = [upd].[DiscontinuedDate]
,[core].[ThumbNailPhoto] = [upd].[ThumbNailPhoto]
,[core].[ThumbnailPhotoFileName] = [upd].[ThumbnailPhotoFileName]
,[core].[rowguid] = [upd].[rowguid]
,[core].[ModifiedDate] = [upd].[ModifiedDate]
,[core].[ChangeHashKey] = [upd].[ChangeHashKey]
,[core].[ChangeType] = [upd].[ChangeType]
,[core].[IsDeleted] = [upd].[IsDeleted]
,[core].[UpdateDate] = [upd].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [upd].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_Product AS core
    INNER JOIN AWLTSRC.SalesLT_Product_UPD AS upd 
    ON [core].[ProductID] = [upd].[ProductID]
    ;
    
    RETURN 0;
END;