CREATE   PROCEDURE AWLTSRC.SalesLT_ProductDescription_Insert
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO AWLTSRC.SalesLT_ProductDescription (
        [ProductDescriptionID], [Description], [rowguid], [ModifiedDate], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    )
    SELECT
        [ProductDescriptionID], [Description], [rowguid], [ModifiedDate], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    FROM AWLTSRC.SalesLT_ProductDescription_INS
    
    RETURN 0;
END;