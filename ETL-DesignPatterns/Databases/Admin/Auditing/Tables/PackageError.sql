CREATE TABLE [Auditing].[PackageError] (
    [PackageErrorID]     INT              IDENTITY (1, 1) NOT NULL,
    [PackageExecutionID] INT              NOT NULL,
    [PackageID]          UNIQUEIDENTIFIER NOT NULL,
    [PackageName]        NVARCHAR (255)   NOT NULL,
    [ServerExecutionID]  BIGINT           NOT NULL,
    [PackageErrorTime]   DATETIME2 (7)    NOT NULL,
    [ErrorCode]          INT              NOT NULL,
    [ErrorDescription]   NVARCHAR (MAX)   NOT NULL
);