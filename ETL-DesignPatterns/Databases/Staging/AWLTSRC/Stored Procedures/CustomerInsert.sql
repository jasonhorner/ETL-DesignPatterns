CREATE PROCEDURE [AWLTSRC].[CustomerInsert]
AS
BEGIN
		SET NOCOUNT ON;
		--TODO Add Error Handling, Logging, and Row Counts

INSERT INTO AWLTSRC.Customer
           (
            CustomerId
		   ,Firstname
           ,LastName
           ,EmailAddress
           ,CDCOperation
		   ,HashKey
		   )
   SELECT 
     ins.CustomerId
     ,ins.Firstname
	 ,ins.LastName
	,ins.EmailAddress
	 ,ins.CDCOperation
	 ,ins.HashKey
       FROM AWLTSRC.Customer_INS ins;
           
	
RETURN 0
END