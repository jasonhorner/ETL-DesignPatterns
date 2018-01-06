:setvar DatabaseName "AdventureWorksLT"
:setvar SchemaName "SalesLT"
:setvar TableName "Customer"

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
-- https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sys-sp-cdc-enable-table-transact-sql

--exec sys.sp_cdc_enable_db;



exec sys.sp_cdc_enable_table
 	'$(SchemaName)', '$(TableName)', '[$(SchemaName)].[$(TableName)] ETL CDC Tracking',
 	@supports_net_changes = 1, @role_name = null;

-- Verification

SELECT [name], is_cdc_enabled, * from sys.databases
WHERE database_id = DB_ID($(DatabaseName))



SELECT s.name AS Schema_Name, tb.name AS Table_Name
, tb.object_id, tb.type, tb.type_desc, tb.is_tracked_by_cdc
FROM sys.tables tb
INNER JOIN sys.schemas s on s.schema_id = tb.schema_id
WHERE tb.is_tracked_by_cdc = 1



declare @start_time datetime, @capturestarted bit;

select CASE WHEN min(tran_end_time) IS NULL THEN 'CDC Not Started' ELSE 'CDC Started' END AS CDCStatus from cdc.lsn_time_mapping;

USE AdventureWorks2012;  
GO  
EXEC sys.sp_cdc_start_job;  
GO  

-- Disable CDC at table Level
USE [$(DatabaseName)]
GO

EXEC sys.sp_cdc_disable_table  
@source_schema = N'$(SchemaName)',  
@source_name   = N'$(TableName)',  
@capture_instance = N'[$(SchemaName)].[$(TableName)] ETL CDC Tracking'  
GO  

-- disable CDC at DB level
USE [$(DatabaseName)];
GO  
EXEC sys.sp_cdc_disable_db  
GO  

