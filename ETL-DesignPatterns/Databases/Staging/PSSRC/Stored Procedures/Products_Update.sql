
/* UPDATE */
CREATE   PROCEDURE PSSRC.Products_Update
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE core
    SET [core].[ProductName] = [upd].[ProductName]
,[core].[StandardCost] = [upd].[StandardCost]
,[core].[ListPrice] = [upd].[ListPrice]
,[core].[ChangeHashKey] = [upd].[ChangeHashKey]
,[core].[ChangeType] = [upd].[ChangeType]
,[core].[IsDeleted] = [upd].[IsDeleted]
,[core].[UpdateDate] = [upd].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [upd].[UpdatePackageExecutionID]
    FROM Products AS core
    INNER JOIN PSSRC.Products_UPD AS upd 
    ON [core].[ProductID] = [upd].[ProductID]
    ;
    
    RETURN 0;
END;