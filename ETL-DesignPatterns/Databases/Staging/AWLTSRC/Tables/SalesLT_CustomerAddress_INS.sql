CREATE TABLE [AWLTSRC].[SalesLT_CustomerAddress_INS] (
    [CustomerID]               INT              NOT NULL,
    [AddressID]                INT              NOT NULL,
    [AddressType]              NVARCHAR (50)    NOT NULL,
    [rowguid]                  UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]             DATETIME         NOT NULL,
    [ChangeHashKey]            NCHAR (40)       NULL,
    [ChangeType]               CHAR (1)         NOT NULL,
    [IsDeleted]                BIT              NOT NULL,
    [InsertDate]               DATETIME2 (7)    NOT NULL,
    [InsertPackageExecutionID] INT              NOT NULL,
    CONSTRAINT [PK_SalesLT_CustomerAddress_INS] PRIMARY KEY CLUSTERED ([CustomerID] ASC, [AddressID] ASC)
);

