CREATE   PROCEDURE AWLTSRC.SalesLT_Customer_Delete
AS
BEGIN
    SET NOCOUNT ON;
    
    /* Soft Delete */
    UPDATE core
    SET [core].[NameStyle] = [del].[NameStyle]
,[core].[Title] = [del].[Title]
,[core].[FirstName] = [del].[FirstName]
,[core].[MiddleName] = [del].[MiddleName]
,[core].[LastName] = [del].[LastName]
,[core].[Suffix] = [del].[Suffix]
,[core].[CompanyName] = [del].[CompanyName]
,[core].[SalesPerson] = [del].[SalesPerson]
,[core].[EmailAddress] = [del].[EmailAddress]
,[core].[Phone] = [del].[Phone]
,[core].[PasswordHash] = [del].[PasswordHash]
,[core].[PasswordSalt] = [del].[PasswordSalt]
,[core].[rowguid] = [del].[rowguid]
,[core].[ModifiedDate] = [del].[ModifiedDate]
,[core].[ChangeHashKey] = [del].[ChangeHashKey]
,[core].[ChangeType] = [del].[ChangeType]
,[core].[IsDeleted] = [del].[IsDeleted]
,[core].[UpdateDate] = [del].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [del].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_Customer AS core
    INNER JOIN AWLTSRC.SalesLT_Customer_DEL AS del 
    ON [core].[CustomerID] = [del].[CustomerID]
    ;
    
    /* Hard Delete */
    /*
    DELETE FROM core
    FROM AWLTSRC.SalesLT_Customer AS core
    WHERE EXISTS (
        SELECT * 
        FROM AWLTSRC.SalesLT_Customer_DEL AS del 
        WHERE [core].[CustomerID] = [del].[CustomerID]
    );
    */
    
    RETURN 0;
END;