CREATE TABLE [AWSRC].[dbo_ErrorLog] (
    [ErrorLogID]     INT             NOT NULL,
    [ErrorTime]      DATETIME        NOT NULL,
    [UserName]       NVARCHAR (128)  NOT NULL,
    [ErrorNumber]    INT             NOT NULL,
    [ErrorSeverity]  INT             NULL,
    [ErrorState]     INT             NULL,
    [ErrorProcedure] NVARCHAR (126)  NULL,
    [ErrorLine]      INT             NULL,
    [ErrorMessage]   NVARCHAR (4000) NOT NULL
);

