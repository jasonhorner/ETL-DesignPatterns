CREATE   PROCEDURE AWLTSRC.SalesLT_SalesOrderHeader_Insert
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO AWLTSRC.SalesLT_SalesOrderHeader (
        [SalesOrderID], [RevisionNumber], [OrderDate], [DueDate], [ShipDate], [Status], [OnlineOrderFlag], [SalesOrderNumber], [PurchaseOrderNumber], [AccountNumber], [CustomerID], [ShipToAddressID], [BillToAddressID], [ShipMethod], [CreditCardApprovalCode], [SubTotal], [TaxAmt], [Freight], [TotalDue], [Comment], [rowguid], [ModifiedDate], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    )
    SELECT
        [SalesOrderID], [RevisionNumber], [OrderDate], [DueDate], [ShipDate], [Status], [OnlineOrderFlag], [SalesOrderNumber], [PurchaseOrderNumber], [AccountNumber], [CustomerID], [ShipToAddressID], [BillToAddressID], [ShipMethod], [CreditCardApprovalCode], [SubTotal], [TaxAmt], [Freight], [TotalDue], [Comment], [rowguid], [ModifiedDate], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    FROM AWLTSRC.SalesLT_SalesOrderHeader_INS
    
    RETURN 0;
END;