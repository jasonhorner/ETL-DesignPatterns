CREATE   PROCEDURE AWLTSRC.SalesLT_SalesOrderHeader_Update
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE core
    SET [core].[RevisionNumber] = [upd].[RevisionNumber]
,[core].[OrderDate] = [upd].[OrderDate]
,[core].[DueDate] = [upd].[DueDate]
,[core].[ShipDate] = [upd].[ShipDate]
,[core].[Status] = [upd].[Status]
,[core].[OnlineOrderFlag] = [upd].[OnlineOrderFlag]
,[core].[SalesOrderNumber] = [upd].[SalesOrderNumber]
,[core].[PurchaseOrderNumber] = [upd].[PurchaseOrderNumber]
,[core].[AccountNumber] = [upd].[AccountNumber]
,[core].[CustomerID] = [upd].[CustomerID]
,[core].[ShipToAddressID] = [upd].[ShipToAddressID]
,[core].[BillToAddressID] = [upd].[BillToAddressID]
,[core].[ShipMethod] = [upd].[ShipMethod]
,[core].[CreditCardApprovalCode] = [upd].[CreditCardApprovalCode]
,[core].[SubTotal] = [upd].[SubTotal]
,[core].[TaxAmt] = [upd].[TaxAmt]
,[core].[Freight] = [upd].[Freight]
,[core].[TotalDue] = [upd].[TotalDue]
,[core].[Comment] = [upd].[Comment]
,[core].[rowguid] = [upd].[rowguid]
,[core].[ModifiedDate] = [upd].[ModifiedDate]
,[core].[ChangeHashKey] = [upd].[ChangeHashKey]
,[core].[ChangeType] = [upd].[ChangeType]
,[core].[IsDeleted] = [upd].[IsDeleted]
,[core].[UpdateDate] = [upd].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [upd].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_SalesOrderHeader AS core
    INNER JOIN AWLTSRC.SalesLT_SalesOrderHeader_UPD AS upd 
    ON [core].[SalesOrderID] = [upd].[SalesOrderID]
    ;
    
    RETURN 0;
END;