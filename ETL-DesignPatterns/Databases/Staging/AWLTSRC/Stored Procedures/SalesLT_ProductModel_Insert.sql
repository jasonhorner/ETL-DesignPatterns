CREATE   PROCEDURE AWLTSRC.SalesLT_ProductModel_Insert
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO AWLTSRC.SalesLT_ProductModel (
        [ProductModelID], [Name], [CatalogDescription], [rowguid], [ModifiedDate], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    )
    SELECT
        [ProductModelID], [Name], [CatalogDescription], [rowguid], [ModifiedDate], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    FROM AWLTSRC.SalesLT_ProductModel_INS
    
    RETURN 0;
END;