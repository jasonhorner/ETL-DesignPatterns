CREATE TABLE [Auditing].[PackageExecution] (
    [PackageExecutionID]     INT              IDENTITY (1, 1) NOT NULL,
    [PackageID]              UNIQUEIDENTIFIER NOT NULL,
    [PackageName]            NVARCHAR (255)   NOT NULL,
    [ParentPackageID]        UNIQUEIDENTIFIER NULL,
    [ParentPackageName]      NVARCHAR (255)   NULL,
    [ServerExecutionID]      BIGINT           NOT NULL,
    [PackageStartTime]       DATETIME2 (7)    NOT NULL,
    [PackageStopTime]        DATETIME2 (7)    NULL,
    [PackageDurationSeconds] AS               (datediff(second,[PackageStartTime],[PackageStopTime])),
    [PackageDurationMinutes] AS               (datediff(minute,[PackageStartTime],[PackageStopTime])),
    [ExecutionStatus]        VARCHAR (10)     NOT NULL,
    [SourceRowCount]         INT              NULL,
    [NewRowCount]            INT              NULL,
    [ChangedRowCount]        INT              NULL,
    [ExistingRowCount]       INT              NULL,
    [DeletedRowCount]        INT              NULL,
    [FlatFileErrorsRowCount] INT              NULL
);