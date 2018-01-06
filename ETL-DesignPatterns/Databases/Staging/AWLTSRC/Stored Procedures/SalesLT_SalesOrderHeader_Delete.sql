CREATE   PROCEDURE AWLTSRC.SalesLT_SalesOrderHeader_Delete
AS
BEGIN
    SET NOCOUNT ON;
    
    /* Soft Delete */
    UPDATE core
    SET [core].[RevisionNumber] = [del].[RevisionNumber]
,[core].[OrderDate] = [del].[OrderDate]
,[core].[DueDate] = [del].[DueDate]
,[core].[ShipDate] = [del].[ShipDate]
,[core].[Status] = [del].[Status]
,[core].[OnlineOrderFlag] = [del].[OnlineOrderFlag]
,[core].[SalesOrderNumber] = [del].[SalesOrderNumber]
,[core].[PurchaseOrderNumber] = [del].[PurchaseOrderNumber]
,[core].[AccountNumber] = [del].[AccountNumber]
,[core].[CustomerID] = [del].[CustomerID]
,[core].[ShipToAddressID] = [del].[ShipToAddressID]
,[core].[BillToAddressID] = [del].[BillToAddressID]
,[core].[ShipMethod] = [del].[ShipMethod]
,[core].[CreditCardApprovalCode] = [del].[CreditCardApprovalCode]
,[core].[SubTotal] = [del].[SubTotal]
,[core].[TaxAmt] = [del].[TaxAmt]
,[core].[Freight] = [del].[Freight]
,[core].[TotalDue] = [del].[TotalDue]
,[core].[Comment] = [del].[Comment]
,[core].[rowguid] = [del].[rowguid]
,[core].[ModifiedDate] = [del].[ModifiedDate]
,[core].[ChangeHashKey] = [del].[ChangeHashKey]
,[core].[ChangeType] = [del].[ChangeType]
,[core].[IsDeleted] = [del].[IsDeleted]
,[core].[UpdateDate] = [del].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [del].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_SalesOrderHeader AS core
    INNER JOIN AWLTSRC.SalesLT_SalesOrderHeader_DEL AS del 
    ON [core].[SalesOrderID] = [del].[SalesOrderID]
    ;
    
    /* Hard Delete */
    /*
    DELETE FROM core
    FROM AWLTSRC.SalesLT_SalesOrderHeader AS core
    WHERE EXISTS (
        SELECT * 
        FROM AWLTSRC.SalesLT_SalesOrderHeader_DEL AS del 
        WHERE [core].[SalesOrderID] = [del].[SalesOrderID]
    );
    */
    
    RETURN 0;
END;