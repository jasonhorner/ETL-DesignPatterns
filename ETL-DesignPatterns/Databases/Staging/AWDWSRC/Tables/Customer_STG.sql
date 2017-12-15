CREATE TABLE [AWDWSRC].[Customer_STG] (
    [CustomerId]   INT           NOT NULL,
    [Firstname]    NVARCHAR (50) NOT NULL,
    [LastName]     NVARCHAR (50) NOT NULL,
    [EmailAddress] NVARCHAR (50) NULL,
    [CDCOperation] CHAR (1)      NULL,
    CONSTRAINT [PK_AWDWSRCCustomer_STG] PRIMARY KEY CLUSTERED ([CustomerId] ASC)
);

