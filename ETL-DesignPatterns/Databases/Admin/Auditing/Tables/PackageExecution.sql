CREATE TABLE [Auditing].[PackageExecution] (
    [PackageExecutionID]     INT            IDENTITY (1, 1) NOT NULL,
    [ServerExecutionID]      INT            NOT NULL,
    [BatchID]                INT            NOT NULL,
    [JobID]                  INT            NOT NULL,
    [PackageID]              NVARCHAR (255) NOT NULL,
    [PackageName]            NVARCHAR (255) NOT NULL,
    [ParentPackageID]        NVARCHAR (255) NULL,
    [ParentPackageName]      NVARCHAR (255) NULL,
    [PackageStartTime]       DATETIME2 (7)  NOT NULL,
    [PackageStopTime]        DATETIME2 (7)  NULL,
    [PackageDurationSeconds] AS             (datediff(second,[PackageStartTime],[PackageStopTime])),
    [PackageDurationMinutes] AS             (datediff(second,[PackageStartTime],[PackageStopTime])/(60)),
    [ExecutionStatus]        VARCHAR (10)   NOT NULL,
    [SelectRowCount]         INT            NULL,
    [InsertRowCount]         INT            NULL,
    [UpdateRowCount]         INT            NULL,
    [DeleteRowCount]         INT            NULL,
    [IgnoreRowCount]         INT            NULL,
    [ErrorRowCount]          INT            NULL
);





