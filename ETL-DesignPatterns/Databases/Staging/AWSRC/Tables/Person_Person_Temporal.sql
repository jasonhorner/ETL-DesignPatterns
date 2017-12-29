CREATE TABLE [AWSRC].[Person_Person_Temporal] (
    [BusinessEntityID] INT           NOT NULL,
    [PersonType]       NCHAR (2)     NOT NULL,
    [NameStyle]        BIT           NOT NULL,
    [Title]            NVARCHAR (8)  NULL,
    [FirstName]        NVARCHAR (50) NOT NULL,
    [MiddleName]       NVARCHAR (50) NULL,
    [LastName]         NVARCHAR (50) NOT NULL,
    [Suffix]           NVARCHAR (10) NULL,
    [EmailPromotion]   INT           NOT NULL,
    [ValidFrom]        DATETIME2 (7) NOT NULL,
    [ValidTo]          DATETIME2 (7) NOT NULL
);

