CREATE   PROCEDURE AWLTSRC.SalesLT_SalesOrderDetail_Delete
AS
BEGIN
    SET NOCOUNT ON;
    
    /* Soft Delete */
    UPDATE core
    SET [core].[OrderQty] = [del].[OrderQty]
,[core].[ProductID] = [del].[ProductID]
,[core].[UnitPrice] = [del].[UnitPrice]
,[core].[UnitPriceDiscount] = [del].[UnitPriceDiscount]
,[core].[LineTotal] = [del].[LineTotal]
,[core].[rowguid] = [del].[rowguid]
,[core].[ModifiedDate] = [del].[ModifiedDate]
,[core].[ChangeHashKey] = [del].[ChangeHashKey]
,[core].[ChangeType] = [del].[ChangeType]
,[core].[IsDeleted] = [del].[IsDeleted]
,[core].[UpdateDate] = [del].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [del].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_SalesOrderDetail AS core
    INNER JOIN AWLTSRC.SalesLT_SalesOrderDetail_DEL AS del 
    ON [core].[SalesOrderID] = [del].[SalesOrderID]
AND [core].[SalesOrderDetailID] = [del].[SalesOrderDetailID]
    ;
    
    /* Hard Delete */
    /*
    DELETE FROM core
    FROM AWLTSRC.SalesLT_SalesOrderDetail AS core
    WHERE EXISTS (
        SELECT * 
        FROM AWLTSRC.SalesLT_SalesOrderDetail_DEL AS del 
        WHERE [core].[SalesOrderID] = [del].[SalesOrderID]
AND [core].[SalesOrderDetailID] = [del].[SalesOrderDetailID]
    );
    */
    
    RETURN 0;
END;