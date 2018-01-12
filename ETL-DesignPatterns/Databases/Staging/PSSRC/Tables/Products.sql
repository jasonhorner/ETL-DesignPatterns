CREATE TABLE [PSSRC].[Products] (
    [ProductID]                VARCHAR (25)    NOT NULL,
    [ProductName]              VARCHAR (50)    NULL,
    [StandardCost]             DECIMAL (10, 2) NULL,
    [ListPrice]                DECIMAL (10, 2) NULL,
    [ChangeHashKey]            NCHAR (40)      NULL,
    [ChangeType]               CHAR (1)        NULL,
    [IsDeleted]                BIT             NULL,
    [InsertDate]               DATETIME2 (7)   NULL,
    [UpdateDate]               DATETIME2 (7)   NULL,
    [InsertPackageExecutionID] INT             NULL,
    [UpdatePackageExecutionID] INT             NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ProductID] ASC)
);

