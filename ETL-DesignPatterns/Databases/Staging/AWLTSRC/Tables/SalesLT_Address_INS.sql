CREATE TABLE [AWLTSRC].[SalesLT_Address_INS] (
    [AddressID]                INT              NOT NULL,
    [AddressLine1]             NVARCHAR (60)    NOT NULL,
    [AddressLine2]             NVARCHAR (60)    NULL,
    [City]                     NVARCHAR (30)    NOT NULL,
    [StateProvince]            NVARCHAR (50)    NOT NULL,
    [CountryRegion]            NVARCHAR (50)    NOT NULL,
    [PostalCode]               NVARCHAR (15)    NOT NULL,
    [rowguid]                  UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]             DATETIME         NOT NULL,
    [ChangeHashKey]            NCHAR (40)       NULL,
    [ChangeType]               CHAR (1)         NOT NULL,
    [IsDeleted]                BIT              NOT NULL,
    [InsertDate]               DATETIME2 (7)    NOT NULL,
    [InsertPackageExecutionID] INT              NOT NULL,
    CONSTRAINT [PK_SalesLT_Address_INS] PRIMARY KEY CLUSTERED ([AddressID] ASC)
);

