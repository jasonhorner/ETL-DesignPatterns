CREATE PROCEDURE [AWLTSRC].[SalesLT_Customer_Delete]

AS
	BEGIN
		SET NOCOUNT ON;
		--TODO Add Error Handling, Logging, and Row Counts

		-- Hard Delete
		DELETE FROM  dest
		FROM AWLTSRC.Customer AS dest
		WHERE EXISTS (
		SELECT * FROM AWLTSRC.Customer_DEL del WHERE dest.CustomerId = del.CustomerId
		);

		-- Soft Delete
		UPDATE dest
		SET 
		-- isDeleted = 1
		--,UpdatedDate = GetDate()
		dest.CustomerID = dest.CustomerID
		FROM [AWLTSRC].[SalesLT_Customer] AS dest
		WHERE EXISTS (
		SELECT * FROM AWLTSRC.Customer_DEL src WHERE dest.CustomerId = src.CustomerId
		);
		


RETURN 0
END