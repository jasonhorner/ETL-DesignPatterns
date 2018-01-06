CREATE TABLE [AWLTSRC].[SalesLT_Address_DEL] (
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
    [UpdateDate]               DATETIME2 (7)    NULL,
    [UpdatePackageExecutionID] INT              NULL,
    CONSTRAINT [PK_SalesLT_Address_DEL] PRIMARY KEY CLUSTERED ([AddressID] ASC)
);

