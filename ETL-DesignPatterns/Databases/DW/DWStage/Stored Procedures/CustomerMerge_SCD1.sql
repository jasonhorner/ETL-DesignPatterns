CREATE PROCEDURE [DWStage].[CustomerMerge_SCD1]

AS
BEGIN
		SET NOCOUNT ON;
		--TODO Add Error Handling, Logging, and Row Counts

		-- WARNING: Does Not handle New Rows(INSERTS)
		MERGE DW.CustomerDimension_SCD1 AS dest 
		USING (SELECT * FROM DWSTAGE.CustomerDimension_SCD1)   
			AS src
		ON (dest.CustomerSk = src.CustomerSK)  
		WHEN MATCHED
			THEN UPDATE SET 
					 dest.FirstName = src.FirstName
					,dest.LastName = src.LastName
					,dest.Birthdate = src.birthdate
					--,dest.EmailAddress = src.EmailAddress
					,dest.MaritalStatus = src.MaritalStatus
					,dest.PurchaseFrequency = src.PurchaseFrequency
					,dest.IncomeLevel = src.IncomeLevel
					,dest.[Address] = src.[Address]
					,dest.[City] = src.City
					,dest.[State] = src.[State]
					,dest.PostalCode = src.PostalCode
					,dest.CurrentDemographicsSk = src.CurrentDemographicsSk
					--,dest.CreateDate = src.CreateDate
					,dest.UpdateDate = src.UpdateDate
					,dest.ChangeHashkey = src.ChangeHashkey
        ;

RETURN 0
END