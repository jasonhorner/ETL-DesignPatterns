CREATE   PROCEDURE AWLTSRC.SalesLT_ProductCategory_Insert
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO AWLTSRC.SalesLT_ProductCategory (
        [ProductCategoryID], [ParentProductCategoryID], [Name], [rowguid], [ModifiedDate], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    )
    SELECT
        [ProductCategoryID], [ParentProductCategoryID], [Name], [rowguid], [ModifiedDate], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    FROM AWLTSRC.SalesLT_ProductCategory_INS
    
    RETURN 0;
END;