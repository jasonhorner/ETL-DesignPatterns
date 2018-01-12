CREATE   PROCEDURE PSSRC.Sales_Insert
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO Sales (
        [SalesID], [FirstName], [LastName], [Email], [Birthdate], [Gender], [IPAdress], [CountryCode], [CountryName], [StateCode], [StateName], [City], [PostalCode], [Address], [CreditCardType], [CreditCardNumber], [Quantity], [SalesDate], [ProductNumber], [SalesAmount], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    )
    SELECT
        [SalesID], [FirstName], [LastName], [Email], [Birthdate], [Gender], [IPAdress], [CountryCode], [CountryName], [StateCode], [StateName], [City], [PostalCode], [Address], [CreditCardType], [CreditCardNumber], [Quantity], [SalesDate], [ProductNumber], [SalesAmount], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    FROM PSSRC.Sales_INS
    
    RETURN 0;
END;