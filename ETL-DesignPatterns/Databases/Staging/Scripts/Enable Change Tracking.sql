-- This query enables the source database for change tracking
ALTER DATABASE AdventureWorksLT  
SET CHANGE_TRACKING = ON  
(CHANGE_RETENTION = 7 DAYS, AUTO_CLEANUP = ON)  ;

-- Snapshot isolation is recomended to simpilify the process of getting changed data
ALTER DATABASE AdventureWorksLT  
    SET ALLOW_SNAPSHOT_ISOLATION ON;  
