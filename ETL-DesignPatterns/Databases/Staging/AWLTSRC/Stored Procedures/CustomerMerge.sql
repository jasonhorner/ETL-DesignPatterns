﻿CREATE PROCEDURE [AWLTSRC].[CustomerMerge]

AS
BEGIN
		SET NOCOUNT ON;
		--TODO Add Error Handling, Logging, and Row Counts

		MERGE AWLTSRC.Customer AS dest 
		USING (SELECT * FROM AWLTSRC.Customer_STG AS stg)   
			AS stg 
		ON (dest.CustomerId = stg.CustomerId)  
		WHEN MATCHED AND stg.cdcOperation = 'D'  
			THEN DELETE  
		WHEN MATCHED AND stg.CdcOperation = 'U'  
			THEN UPDATE SET 
					 dest.Firstname = stg.Firstname
					,dest.LastName = stg.LastName
					,dest.EmailAddress = stg.EmailAddress
					,dest.CDCOperation = stg.CDCOperation
		/*
		OUTPUT $action, Inserted.CustomerId, Inserted.Firstname, 
			Inserted.LastName, Inserted.EmailAddress Deleted.CustomerId,, Deleted.CDCOperation
			Deleted.Firstname , Deleted.LastName, Deleted.EmailAddress, Deleted.CDCOperation
		*/
        ;

RETURN 0
END