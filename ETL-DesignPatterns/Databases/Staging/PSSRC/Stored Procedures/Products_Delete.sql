
-------------------------------------------------------------------








/* Create Destination Procedures */
/* DELETE */
CREATE   PROCEDURE PSSRC.Products_Delete
AS
BEGIN
    SET NOCOUNT ON;
    
    /* Soft Delete */
    UPDATE core
    SET [core].[ProductName] = [del].[ProductName]
,[core].[StandardCost] = [del].[StandardCost]
,[core].[ListPrice] = [del].[ListPrice]
,[core].[ChangeHashKey] = [del].[ChangeHashKey]
,[core].[ChangeType] = [del].[ChangeType]
,[core].[IsDeleted] = [del].[IsDeleted]
,[core].[UpdateDate] = [del].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [del].[UpdatePackageExecutionID]
    FROM Products AS core
    INNER JOIN PSSRC.Products_DEL AS del 
    ON [core].[ProductID] = [del].[ProductID]
    ;
    
    /* Hard Delete */
    /*
    DELETE FROM core
    FROM Products AS core
    WHERE EXISTS (
        SELECT * 
        FROM PSSRC.Products_DEL AS del 
        WHERE [core].[ProductID] = [del].[ProductID]
    );
    */
    
    RETURN 0;
END;