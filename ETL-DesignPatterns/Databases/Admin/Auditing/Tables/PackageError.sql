CREATE TABLE [Auditing].[PackageError] (
    [PackageErrorID]     INT            IDENTITY (1, 1) NOT NULL,
    [PackageExecutionID] INT            NOT NULL,
    [ServerExecutionID]  INT            NOT NULL,
    [BatchID]            INT            NOT NULL,
    [JobID]              INT            NOT NULL,
    [PackageID]          NVARCHAR (255) NOT NULL,
    [PackageName]        NVARCHAR (255) NOT NULL,
    [PackageErrorTime]   DATETIME2 (7)  NOT NULL,
    [ErrorCode]          INT            NOT NULL,
    [ErrorDescription]   NVARCHAR (MAX) NOT NULL
);

