:setvar DatabaseName "<DBName>"

:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END
GO

USE [$(DatabaseName)];


GO

-- Enable CDC at the database level
exec sys.sp_cdc_enable_db;

-- https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sys-sp-cdc-enable-table-transact-sql

exec sys.sp_cdc_enable_table
 	'dbo', 'DimCustomer', 'DimCustomer CDC Tracking',
 	@supports_net_changes = 1, @role_name = null;

-- Verification
SELECT is_cdc_enabled from sys.databases
WHERE name = 'AdventureWorksDW2014'
AND is_cdc_enabled = 1;

declare @start_time datetime, @capturestarted bit;

select CASE WHEN min(tran_end_time) IS NULL THEN 'CDC Not Started' ELSE 'CDC Started' END AS CDCStatus from cdc.lsn_time_mapping;
/*
if @start_time is null
begin
	select @capturestarted = 0;
	end
else
begin
	select @capturestarted = 1;
end

select @capturestarted as CaptureStarted
*/