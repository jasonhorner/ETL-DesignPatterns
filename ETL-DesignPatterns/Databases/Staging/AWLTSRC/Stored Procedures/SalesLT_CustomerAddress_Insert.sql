CREATE   PROCEDURE AWLTSRC.SalesLT_CustomerAddress_Insert
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO AWLTSRC.SalesLT_CustomerAddress (
        [CustomerID], [AddressID], [AddressType], [rowguid], [ModifiedDate], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    )
    SELECT
        [CustomerID], [AddressID], [AddressType], [rowguid], [ModifiedDate], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    FROM AWLTSRC.SalesLT_CustomerAddress_INS
    
    RETURN 0;
END;