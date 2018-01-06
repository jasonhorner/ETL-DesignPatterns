CREATE   PROCEDURE AWLTSRC.SalesLT_ProductModelProductDescription_Insert
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO AWLTSRC.SalesLT_ProductModelProductDescription (
        [ProductModelID], [ProductDescriptionID], [Culture], [rowguid], [ModifiedDate], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    )
    SELECT
        [ProductModelID], [ProductDescriptionID], [Culture], [rowguid], [ModifiedDate], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    FROM AWLTSRC.SalesLT_ProductModelProductDescription_INS
    
    RETURN 0;
END;