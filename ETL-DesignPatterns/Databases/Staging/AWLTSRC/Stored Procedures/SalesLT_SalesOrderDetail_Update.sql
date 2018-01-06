CREATE   PROCEDURE AWLTSRC.SalesLT_SalesOrderDetail_Update
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE core
    SET [core].[OrderQty] = [upd].[OrderQty]
,[core].[ProductID] = [upd].[ProductID]
,[core].[UnitPrice] = [upd].[UnitPrice]
,[core].[UnitPriceDiscount] = [upd].[UnitPriceDiscount]
,[core].[LineTotal] = [upd].[LineTotal]
,[core].[rowguid] = [upd].[rowguid]
,[core].[ModifiedDate] = [upd].[ModifiedDate]
,[core].[ChangeHashKey] = [upd].[ChangeHashKey]
,[core].[ChangeType] = [upd].[ChangeType]
,[core].[IsDeleted] = [upd].[IsDeleted]
,[core].[UpdateDate] = [upd].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [upd].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_SalesOrderDetail AS core
    INNER JOIN AWLTSRC.SalesLT_SalesOrderDetail_UPD AS upd 
    ON [core].[SalesOrderID] = [upd].[SalesOrderID]
AND [core].[SalesOrderDetailID] = [upd].[SalesOrderDetailID]
    ;
    
    RETURN 0;
END;