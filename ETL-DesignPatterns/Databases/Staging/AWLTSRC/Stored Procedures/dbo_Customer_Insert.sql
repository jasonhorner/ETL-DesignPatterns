
/* INSERT */
CREATE   PROCEDURE AWLTSRC.dbo_Customer_Insert
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO AWLTSRC.dbo_Customer (
        [CustomerID], [FirstName], [LastName], [EmailAddress], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    )
    SELECT
        [CustomerID], [FirstName], [LastName], [EmailAddress], [ChangeHashKey], [ChangeType], [IsDeleted], [InsertDate], [InsertPackageExecutionID]
    FROM AWLTSRC.dbo_Customer_INS
    
    RETURN 0;
END;