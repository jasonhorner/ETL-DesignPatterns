CREATE TABLE [AWLTSRC].[SalesLT_ProductModelProductDescription_INS] (
    [ProductModelID]           INT              NOT NULL,
    [ProductDescriptionID]     INT              NOT NULL,
    [Culture]                  NCHAR (6)        NOT NULL,
    [rowguid]                  UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]             DATETIME         NOT NULL,
    [ChangeHashKey]            NCHAR (40)       NULL,
    [ChangeType]               CHAR (1)         NOT NULL,
    [IsDeleted]                BIT              NOT NULL,
    [InsertDate]               DATETIME2 (7)    NOT NULL,
    [InsertPackageExecutionID] INT              NOT NULL,
    CONSTRAINT [PK_SalesLT_ProductModelProductDescription_INS] PRIMARY KEY CLUSTERED ([ProductModelID] ASC, [ProductDescriptionID] ASC, [Culture] ASC)
);

