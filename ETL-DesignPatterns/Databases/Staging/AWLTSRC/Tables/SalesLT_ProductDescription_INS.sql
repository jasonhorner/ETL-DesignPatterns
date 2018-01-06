CREATE TABLE [AWLTSRC].[SalesLT_ProductDescription_INS] (
    [ProductDescriptionID]     INT              NOT NULL,
    [Description]              NVARCHAR (400)   NOT NULL,
    [rowguid]                  UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]             DATETIME         NOT NULL,
    [ChangeHashKey]            NCHAR (40)       NULL,
    [ChangeType]               CHAR (1)         NOT NULL,
    [IsDeleted]                BIT              NOT NULL,
    [InsertDate]               DATETIME2 (7)    NOT NULL,
    [InsertPackageExecutionID] INT              NOT NULL,
    CONSTRAINT [PK_SalesLT_ProductDescription_INS] PRIMARY KEY CLUSTERED ([ProductDescriptionID] ASC)
);

