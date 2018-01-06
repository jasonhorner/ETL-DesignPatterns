CREATE   PROCEDURE AWLTSRC.SalesLT_CustomerAddress_Update
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE core
    SET [core].[AddressType] = [upd].[AddressType]
,[core].[rowguid] = [upd].[rowguid]
,[core].[ModifiedDate] = [upd].[ModifiedDate]
,[core].[ChangeHashKey] = [upd].[ChangeHashKey]
,[core].[ChangeType] = [upd].[ChangeType]
,[core].[IsDeleted] = [upd].[IsDeleted]
,[core].[UpdateDate] = [upd].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [upd].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_CustomerAddress AS core
    INNER JOIN AWLTSRC.SalesLT_CustomerAddress_UPD AS upd 
    ON [core].[CustomerID] = [upd].[CustomerID]
AND [core].[AddressID] = [upd].[AddressID]
    ;
    
    RETURN 0;
END;