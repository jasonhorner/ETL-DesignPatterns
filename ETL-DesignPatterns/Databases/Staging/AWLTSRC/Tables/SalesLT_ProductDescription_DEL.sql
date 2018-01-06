CREATE TABLE [AWLTSRC].[SalesLT_ProductDescription_DEL] (
    [ProductDescriptionID]     INT              NOT NULL,
    [Description]              NVARCHAR (400)   NOT NULL,
    [rowguid]                  UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]             DATETIME         NOT NULL,
    [ChangeHashKey]            NCHAR (40)       NULL,
    [ChangeType]               CHAR (1)         NOT NULL,
    [IsDeleted]                BIT              NOT NULL,
    [UpdateDate]               DATETIME2 (7)    NULL,
    [UpdatePackageExecutionID] INT              NULL,
    CONSTRAINT [PK_SalesLT_ProductDescription_DEL] PRIMARY KEY CLUSTERED ([ProductDescriptionID] ASC)
);

