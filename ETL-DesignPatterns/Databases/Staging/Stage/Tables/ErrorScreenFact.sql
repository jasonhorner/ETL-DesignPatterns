CREATE TABLE [Stage].[ErrorScreenFact] (
    [ErrorScreenFactSK]           INT IDENTITY (1, 1) NOT NULL,
    [ErrorScreenSk]               INT NOT NULL,
    [ErrorScreenDateSk]           INT NOT NULL,
    [ErrorScreenTableDimensionSk] INT NOT NULL,
    [ErrorRecordId]               INT NOT NULL,
    [BatchSK]                     INT NOT NULL
);

