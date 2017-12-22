USE Admin;
GO

SELECT TOP (1000) *
FROM Auditing.PackageExecution WITH (NOLOCK)
ORDER BY PackageExecutionID DESC;

SELECT TOP (1000) *
FROM Auditing.PackageError WITH (NOLOCK)
ORDER BY PackageErrorID DESC;