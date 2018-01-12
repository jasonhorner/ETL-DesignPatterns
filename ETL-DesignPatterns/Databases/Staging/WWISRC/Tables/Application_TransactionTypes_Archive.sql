CREATE TABLE [WWISRC].[Application_TransactionTypes_Archive] (
    [TransactionTypeID]   INT           NOT NULL,
    [TransactionTypeName] NVARCHAR (50) NOT NULL,
    [LastEditedBy]        INT           NOT NULL,
    [ValidFrom]           DATETIME2 (7) NOT NULL,
    [ValidTo]             DATETIME2 (7) NOT NULL
);

