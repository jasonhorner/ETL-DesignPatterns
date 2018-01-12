USE Admin;
GO

SELECT TOP (1000)
	PackageExecutionID
   ,PackageName
   ,ExecutionStatus
   ,SelectRowCount
   ,InsertRowCount
   ,UpdateRowCount
   ,DeleteRowCount
   ,IgnoreRowCount
   ,ErrorRowCount
   ,PackageStartTime
   ,PackageStopTime
   ,PackageDurationSeconds
   ,PackageDurationMinutes
FROM Auditing.PackageExecution WITH (NOLOCK)
ORDER BY PackageExecutionID DESC;

SELECT TOP (1000) *
FROM Auditing.PackageExecution WITH (NOLOCK)
ORDER BY PackageExecutionID DESC;

SELECT TOP (1000) *
FROM Auditing.PackageError WITH (NOLOCK)
ORDER BY PackageErrorID DESC;

SELECT TOP (1000) *  
FROM Auditing.FlatFileError;