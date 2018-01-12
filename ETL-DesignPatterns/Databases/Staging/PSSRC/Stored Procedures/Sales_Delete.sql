CREATE   PROCEDURE PSSRC.Sales_Delete
AS
BEGIN
    SET NOCOUNT ON;
    
    /* Soft Delete */
    UPDATE core
    SET [core].[FirstName] = [del].[FirstName]
,[core].[LastName] = [del].[LastName]
,[core].[Email] = [del].[Email]
,[core].[Birthdate] = [del].[Birthdate]
,[core].[Gender] = [del].[Gender]
,[core].[IPAdress] = [del].[IPAdress]
,[core].[CountryCode] = [del].[CountryCode]
,[core].[CountryName] = [del].[CountryName]
,[core].[StateCode] = [del].[StateCode]
,[core].[StateName] = [del].[StateName]
,[core].[City] = [del].[City]
,[core].[PostalCode] = [del].[PostalCode]
,[core].[Address] = [del].[Address]
,[core].[CreditCardType] = [del].[CreditCardType]
,[core].[CreditCardNumber] = [del].[CreditCardNumber]
,[core].[Quantity] = [del].[Quantity]
,[core].[SalesDate] = [del].[SalesDate]
,[core].[ProductNumber] = [del].[ProductNumber]
,[core].[SalesAmount] = [del].[SalesAmount]
,[core].[ChangeHashKey] = [del].[ChangeHashKey]
,[core].[ChangeType] = [del].[ChangeType]
,[core].[IsDeleted] = [del].[IsDeleted]
,[core].[UpdateDate] = [del].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [del].[UpdatePackageExecutionID]
    FROM Sales AS core
    INNER JOIN PSSRC.Sales_DEL AS del 
    ON [core].[SalesID] = [del].[SalesID]
    ;
    
    /* Hard Delete */
    /*
    DELETE FROM core
    FROM Sales AS core
    WHERE EXISTS (
        SELECT * 
        FROM PSSRC.Sales_DEL AS del 
        WHERE [core].[SalesID] = [del].[SalesID]
    );
    */
    
    RETURN 0;
END;