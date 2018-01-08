CREATE TABLE [AWLTSRC].[dbo_Customer_UPD] (
    [CustomerID]               INT           NOT NULL,
    [FirstName]                NVARCHAR (50) NULL,
    [LastName]                 NVARCHAR (50) NULL,
    [EmailAddress]             NVARCHAR (50) NULL,
    [ChangeHashKey]            NCHAR (40)    NULL,
    [ChangeType]               CHAR (1)      NULL,
    [IsDeleted]                BIT           NULL,
    [UpdateDate]               DATETIME2 (7) NULL,
    [UpdatePackageExecutionID] INT           NULL,
    CONSTRAINT [PK_dbo_Customer_UPD] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);

