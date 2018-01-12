CREATE   PROCEDURE PSSRC.Sales_Update
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE core
    SET [core].[FirstName] = [upd].[FirstName]
,[core].[LastName] = [upd].[LastName]
,[core].[Email] = [upd].[Email]
,[core].[Birthdate] = [upd].[Birthdate]
,[core].[Gender] = [upd].[Gender]
,[core].[IPAdress] = [upd].[IPAdress]
,[core].[CountryCode] = [upd].[CountryCode]
,[core].[CountryName] = [upd].[CountryName]
,[core].[StateCode] = [upd].[StateCode]
,[core].[StateName] = [upd].[StateName]
,[core].[City] = [upd].[City]
,[core].[PostalCode] = [upd].[PostalCode]
,[core].[Address] = [upd].[Address]
,[core].[CreditCardType] = [upd].[CreditCardType]
,[core].[CreditCardNumber] = [upd].[CreditCardNumber]
,[core].[Quantity] = [upd].[Quantity]
,[core].[SalesDate] = [upd].[SalesDate]
,[core].[ProductNumber] = [upd].[ProductNumber]
,[core].[SalesAmount] = [upd].[SalesAmount]
,[core].[ChangeHashKey] = [upd].[ChangeHashKey]
,[core].[ChangeType] = [upd].[ChangeType]
,[core].[IsDeleted] = [upd].[IsDeleted]
,[core].[UpdateDate] = [upd].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [upd].[UpdatePackageExecutionID]
    FROM Sales AS core
    INNER JOIN PSSRC.Sales_UPD AS upd 
    ON [core].[SalesID] = [upd].[SalesID]
    ;
    
    RETURN 0;
END;