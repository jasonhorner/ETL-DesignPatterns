CREATE PROCEDURE [AWLTSRC].[CustomerUpdate]
	@param1 int = 0,
	@param2 int
AS
BEGIN
		SET NOCOUNT ON;
		--TODO Add Error Handling, Logging, and Row Counts

		UPDATE dest
		SET 
			 dest.Firstname = updts.Firstname
			,dest.LastName = updts.LastName
			,dest.EmailAddress = updts.EmailAddress
			,dest.CDCOperation = updts.CDCOperation
			-- TODO Add Audit Columns
		FROM 
			AWLTSRC.Customer	dest, 
			AWLTSRC.Customer_UPD	updts
		WHERE 
			dest.CustomerId = updts.CustomerId;

RETURN 0
END
