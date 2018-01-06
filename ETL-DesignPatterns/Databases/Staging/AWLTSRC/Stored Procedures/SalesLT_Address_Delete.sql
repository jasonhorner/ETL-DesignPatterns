
-------------------------------------------------------------------





    
/* Create Destination Procedures */
/* DELETE */
CREATE   PROCEDURE AWLTSRC.SalesLT_Address_Delete
AS
BEGIN
    SET NOCOUNT ON;
    
    /* Soft Delete */
    UPDATE core
    SET [core].[AddressLine1] = [del].[AddressLine1]
,[core].[AddressLine2] = [del].[AddressLine2]
,[core].[City] = [del].[City]
,[core].[StateProvince] = [del].[StateProvince]
,[core].[CountryRegion] = [del].[CountryRegion]
,[core].[PostalCode] = [del].[PostalCode]
,[core].[rowguid] = [del].[rowguid]
,[core].[ModifiedDate] = [del].[ModifiedDate]
,[core].[ChangeHashKey] = [del].[ChangeHashKey]
,[core].[ChangeType] = [del].[ChangeType]
,[core].[IsDeleted] = [del].[IsDeleted]
,[core].[UpdateDate] = [del].[UpdateDate]
,[core].[UpdatePackageExecutionID] = [del].[UpdatePackageExecutionID]
    FROM AWLTSRC.SalesLT_Address AS core
    INNER JOIN AWLTSRC.SalesLT_Address_DEL AS del 
    ON [core].[AddressID] = [del].[AddressID]
    ;
    
    /* Hard Delete */
    /*
    DELETE FROM core
    FROM AWLTSRC.SalesLT_Address AS core
    WHERE EXISTS (
        SELECT * 
        FROM AWLTSRC.SalesLT_Address_DEL AS del 
        WHERE [core].[AddressID] = [del].[AddressID]
    );
    */
    
    RETURN 0;
END;