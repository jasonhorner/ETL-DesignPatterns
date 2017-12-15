CREATE TABLE [AWDWSRC].[Customer] (
    [CustomerId]   INT           NOT NULL,
    [Firstname]    NVARCHAR (50) NOT NULL,
    [LastName]     NVARCHAR (50) NOT NULL,
    [EmailAddress] NVARCHAR (50) NULL,
    [CDCOperation] CHAR (1)      NULL,
    CONSTRAINT [PK_AWDWSRCCustomer] PRIMARY KEY CLUSTERED ([CustomerId] ASC)
);

