
/* INSERT */
CREATE   PROCEDURE PSSRC.Products_Insert
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO Products (
        [ProductID], [ProductName], [StandardCost], [ListPrice], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    )
    SELECT
        [ProductID], [ProductName], [StandardCost], [ListPrice], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    FROM PSSRC.Products_INS
    
    RETURN 0;
END;