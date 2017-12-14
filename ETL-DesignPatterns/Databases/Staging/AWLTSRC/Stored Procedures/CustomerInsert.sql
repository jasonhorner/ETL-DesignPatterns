CREATE PROCEDURE [AWLTSRC].[CustomerInsert]
	@param1 int = 0,
	@param2 int
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
           ,CDCOperation)
   SELECT 
     ins.CustomerId
     ,ins.Firstname
	 ,ins.LastName
	,ins.EmailAddress
	 ,ins.CDCOperation
       FROM AWLTSRC.Customer_INS ins;
           
	
RETURN 0
END