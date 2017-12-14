CREATE PROCEDURE [AWLTSRC].[CustomerDelete]

AS
	BEGIN
		SET NOCOUNT ON;
		--TODO Add Error Handling, Logging, and Row Counts

		DELETE FROM  dest
		FROM AWLTSRC.Customer AS dest
		WHERE EXISTS (
		SELECT * FROM AWLTSRC.Customer_DEL del WHERE dest.CustomerId = del.CustomerId
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
