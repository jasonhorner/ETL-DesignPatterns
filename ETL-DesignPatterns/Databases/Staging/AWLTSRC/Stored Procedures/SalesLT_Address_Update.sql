
/* UPDATE */
CREATE   PROCEDURE AWLTSRC.SalesLT_Address_Update
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE core
    SET [core].[AddressLine1] = [upd].[AddressLine1]
,[core].[AddressLine2] = [upd].[AddressLine2]
,[core].[City] = [upd].[City]
,[core].[StateProvince] = [upd].[StateProvince]
,[core].[CountryRegion] = [upd].[CountryRegion]
,[core].[PostalCode] = [upd].[PostalCode]
,[core].[rowguid] = [upd].[rowguid]
,[core].[ModifiedDate] = [upd].[ModifiedDate]
,[core].[ChangeHashKey] = [upd].[ChangeHashKey]
,[core].[ChangeType] = [upd].[ChangeType]
,[core].[IsDeleted] = [upd].[IsDeleted]
,[core].[UpdateDate] = [upd].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [upd].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_Address AS core
    INNER JOIN AWLTSRC.SalesLT_Address_UPD AS upd 
    ON [core].[AddressID] = [upd].[AddressID]
    ;
    
    RETURN 0;
END;