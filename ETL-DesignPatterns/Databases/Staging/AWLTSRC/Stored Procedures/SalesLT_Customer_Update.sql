CREATE   PROCEDURE AWLTSRC.SalesLT_Customer_Update
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE core
    SET [core].[NameStyle] = [upd].[NameStyle]
,[core].[Title] = [upd].[Title]
,[core].[FirstName] = [upd].[FirstName]
,[core].[MiddleName] = [upd].[MiddleName]
,[core].[LastName] = [upd].[LastName]
,[core].[Suffix] = [upd].[Suffix]
,[core].[CompanyName] = [upd].[CompanyName]
,[core].[SalesPerson] = [upd].[SalesPerson]
,[core].[EmailAddress] = [upd].[EmailAddress]
,[core].[Phone] = [upd].[Phone]
,[core].[PasswordHash] = [upd].[PasswordHash]
,[core].[PasswordSalt] = [upd].[PasswordSalt]
,[core].[rowguid] = [upd].[rowguid]
,[core].[ModifiedDate] = [upd].[ModifiedDate]
,[core].[ChangeHashKey] = [upd].[ChangeHashKey]
,[core].[ChangeType] = [upd].[ChangeType]
,[core].[IsDeleted] = [upd].[IsDeleted]
,[core].[UpdateDate] = [upd].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [upd].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_Customer AS core
    INNER JOIN AWLTSRC.SalesLT_Customer_UPD AS upd 
    ON [core].[CustomerID] = [upd].[CustomerID]
    ;
    
    RETURN 0;
END;