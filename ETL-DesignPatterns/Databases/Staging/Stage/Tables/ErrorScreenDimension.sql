CREATE TABLE [Stage].[ErrorScreenDimension] (
    [ErrorScreenSk]          INT           IDENTITY (1, 1) NOT NULL,
    [ErrorScreenCode]        VARCHAR (12)  NOT NULL,
    [ErrorScreenDescription] VARCHAR (100) NULL,
    [ErrorScreenStatus]      VARCHAR (50)  NULL
);

