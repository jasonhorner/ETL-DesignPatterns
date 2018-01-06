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


-- This query enables the source database for change tracking

ALTER DATABASE [$(DatabaseName)] 
SET CHANGE_TRACKING = ON  
(CHANGE_RETENTION = 7 DAYS, AUTO_CLEANUP = ON)  ;


-- Snapshot isolation is recomended to simpilify the process of getting changed data
ALTER DATABASE [$(DatabaseName)]  
    SET ALLOW_SNAPSHOT_ISOLATION ON;  
GO

-- Each Table must have changed tracking enabled
ALTER TABLE [$(SchemaName)].[$(TableName)]  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON); 

-- Verification
SELECT d.[Name], ctd.database_id, d.snapshot_isolation_state_desc, ctd.* 
FROM sys.change_tracking_databases ctd
inner join sys.databases d on (ctd.database_id = d.database_id)
WHERE ctd.database_id = DB_ID($(DatabaseName));

SELECT s.name as Schema_name, t.name AS Table_name, tr.*
FROM sys.change_tracking_tables tr
INNER JOIN sys.tables t on t.object_id = tr.object_id
INNER JOIN sys.schemas s on s.schema_id = t.schema_id

-- Disbale change tracking at the table level
ALTER TABLE [$(SchemaName)].[$(TableName)]  
DISABLE CHANGE_TRACKING;  

-- DISABLE Change tracking at the DB level
ALTER DATABASE [$(DatabaseName)] 
SET CHANGE_TRACKING = OFF  

