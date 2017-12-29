CREATE TABLE [AWSRC].[Person_Person_json] (
    [PersonID]              INT              NOT NULL,
    [PersonType]            NCHAR (2)        NOT NULL,
    [NameStyle]             BIT              NOT NULL,
    [Title]                 NVARCHAR (8)     NULL,
    [FirstName]             NVARCHAR (50)    NOT NULL,
    [MiddleName]            NVARCHAR (50)    NULL,
    [LastName]              NVARCHAR (50)    NOT NULL,
    [Suffix]                NVARCHAR (10)    NULL,
    [EmailPromotion]        INT              NOT NULL,
    [AdditionalContactInfo] NVARCHAR (MAX)   NULL,
    [Demographics]          NVARCHAR (MAX)   NULL,
    [rowguid]               UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]          DATETIME         NOT NULL,
    [PhoneNumbers]          NVARCHAR (MAX)   NULL,
    [EmailAddresses]        NVARCHAR (MAX)   NULL
);

