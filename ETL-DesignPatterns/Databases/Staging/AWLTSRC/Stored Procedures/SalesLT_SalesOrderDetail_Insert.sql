CREATE   PROCEDURE AWLTSRC.SalesLT_SalesOrderDetail_Insert
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO AWLTSRC.SalesLT_SalesOrderDetail (
        [SalesOrderID], [SalesOrderDetailID], [OrderQty], [ProductID], [UnitPrice], [UnitPriceDiscount], [LineTotal], [rowguid], [ModifiedDate], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    )
    SELECT
        [SalesOrderID], [SalesOrderDetailID], [OrderQty], [ProductID], [UnitPrice], [UnitPriceDiscount], [LineTotal], [rowguid], [ModifiedDate], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    FROM AWLTSRC.SalesLT_SalesOrderDetail_INS
    
    RETURN 0;
END;