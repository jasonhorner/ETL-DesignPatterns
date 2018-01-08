USE [Staging]
GO

/* Hash */
SELECT * FROM AWLTSRC.dbo_Customer;
SELECT * FROM AWLTSRC.dbo_Customer_INS;
SELECT * FROM AWLTSRC.dbo_Customer_UPD;
SELECT * FROM AWLTSRC.dbo_Customer_DEL;

/* CT and CDC */
SELECT * FROM AWLTSRC.dbo_Customer;
SELECT * FROM AWLTSRC.dbo_Customer_STG;