CREATE PROCEDURE [AWLTSRC].[CustomerDelete]
	@param1 int = 0,
	@param2 int
AS
	BEGIN
		SET NOCOUNT ON;
		--TODO Add Error Handling, Logging, and Row Counts

		DELETE FROM  cust 
		FROM AWLTSRC.Customer AS cust 
		WHERE EXISTS (
		SELECT * FROM AWLTSRC.Customer_DEL del WHERE a.CustomerId = del.CustomerId
		);

		/*
		DELETE FROM AWLTSRC.Customer
		WHERE CustomerId in 
		(SELECT CustomerId FROM 
			AWLTSRC.Customer_DEL
		)
		*/


RETURN 0
END
