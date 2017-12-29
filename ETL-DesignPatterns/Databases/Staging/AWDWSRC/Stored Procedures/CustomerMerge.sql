CREATE PROCEDURE [AWDWSRC].[CustomerMerge]

AS
BEGIN
		SET NOCOUNT ON;
		--TODO Add Error Handling, Logging, and Row Counts

		-- WARNING: Does Not handle New Rows(INSERTS)
		MERGE AWDWSRC.dbo_DimCustomer AS dest 
		USING (SELECT * FROM AWDWSRC.dbo_DimCustomer_STG AS stg)   
			AS stg 
		ON (dest.CustomerKey = stg.CustomerKey)  
		WHEN MATCHED AND stg.CDCOperation = 'D'  
		     -- TODO: Handle soft deletes
			THEN DELETE  
		WHEN MATCHED AND stg.CDCOperation = 'U'  
			THEN UPDATE SET 
						  dest.[GeographyKey] = stg.[GeographyKey]
						, dest.[CustomerAlternateKey] = stg.[CustomerAlternateKey]
						, dest.[Title] = stg.[Title] 
						, dest.[FirstName] = stg.[FirstName]
						, dest.[MiddleName] = stg.[MiddleName] 
						, dest.[LastName] = stg.[LastName]
						, dest.[NameStyle] = stg.[NameStyle]
						, dest.[BirthDate] = stg.[BirthDate]
						, dest.[MaritalStatus] = stg.[MaritalStatus]
						, dest.[Suffix] = stg.[Suffix] 
						, dest.[Gender] = stg.[Gender]
						, dest.[EmailAddress] = stg.[EmailAddress]
						, dest.[YearlyIncome] = stg.[YearlyIncome]
						, dest.[TotalChildren] = stg.[TotalChildren]
						, dest.[NumberChildrenAtHome] = stg.[NumberChildrenAtHome]
						, dest.[EnglishEducation] = stg.[EnglishEducation]
						, dest.[SpanishEducation] = stg.[SpanishEducation]
						, dest.[FrenchEducation] = stg.[FrenchEducation]
						, dest.[EnglishOccupation] = stg.[EnglishOccupation]
						, dest.[SpanishOccupation] = stg.[SpanishOccupation]
						, dest.[FrenchOccupation] = stg.[FrenchOccupation]
						, dest.[HouseOwnerFlag] = stg.[HouseOwnerFlag]
						, dest.[NumberCarsOwned] = stg.[NumberCarsOwned]
						, dest.[AddressLine1] = stg.[AddressLine1]
						, dest.[AddressLine2] = stg.[AddressLine2]
						, dest.[Phone] = stg.[Phone]
						, dest.[DateFirstPurchase] = stg.[DateFirstPurchase]
						, dest.[CommuteDistance] = stg.[CommuteDistance]
						, dest.[CDCOperation] = stg.[CDCOperation]
        ;

RETURN 0
END