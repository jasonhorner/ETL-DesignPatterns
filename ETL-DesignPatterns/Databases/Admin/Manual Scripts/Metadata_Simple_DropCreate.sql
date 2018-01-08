USE Admin;
GO

/* --------------------------------------------------
-- Create Schemas
-------------------------------------------------- */
DECLARE @query nvarchar(4000) = 'CREATE SCHEMA [Meta] AUTHORIZATION [dbo];';
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Meta')
    EXEC (@query);
GO

/* --------------------------------------------------
-- Cleanup Views
-------------------------------------------------- */
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.vProject') AND type IN (N'V'))
	DROP VIEW Meta.vProject;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.vProjectType') AND type IN (N'V'))
	DROP VIEW Meta.vProjectType;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.vConnection') AND type IN (N'V'))
	DROP VIEW Meta.vConnection;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.vConnectionManagerType') AND type IN (N'V'))
	DROP VIEW Meta.vConnectionManagerType;
GO

/* --------------------------------------------------
-- Cleanup Tables
-------------------------------------------------- */
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.Project') AND type IN (N'U'))
BEGIN
    ALTER TABLE Meta.Project SET (SYSTEM_VERSIONING = OFF);
    DROP TABLE Meta.Project_History;
    DROP TABLE Meta.Project;
END;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.ProjectType') AND type IN (N'U'))
BEGIN
    ALTER TABLE Meta.ProjectType SET (SYSTEM_VERSIONING = OFF);
    DROP TABLE Meta.ProjectType_History;
    DROP TABLE Meta.ProjectType;
END;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.Connection') AND type IN (N'U'))
BEGIN
    ALTER TABLE Meta.Connection SET (SYSTEM_VERSIONING = OFF);
    DROP TABLE Meta.Connection_History;
    DROP TABLE Meta.Connection;
END;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.ConnectionManagerType') AND type IN (N'U'))
BEGIN
    ALTER TABLE Meta.ConnectionManagerType SET (SYSTEM_VERSIONING = OFF);
    DROP TABLE Meta.ConnectionManagerType_History;
    DROP TABLE Meta.ConnectionManagerType;
END;
GO

/* --------------------------------------------------
-- Create Metadata Table: ConnectionManagerType
-------------------------------------------------- */
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.ConnectionManagerType') AND type IN (N'U'))
BEGIN
    CREATE TABLE Meta.ConnectionManagerType (
        ConnectionManagerTypeID SMALLINT IDENTITY(1, 1) NOT NULL
       ,ConnectionManagerType VARCHAR(20) NOT NULL
       ,ConnectionManagerTypeDescription VARCHAR(200) NULL
       ,ValidFrom DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL
       ,ValidTo DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL
       ,PERIOD FOR SYSTEM_TIME(ValidFrom, ValidTo)
       ,CONSTRAINT PK_ConnectionManagerType PRIMARY KEY (ConnectionManagerTypeID)
       ,CONSTRAINT UQ_ConnectionManagerType UNIQUE (ConnectionManagerType)
    )
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Meta.ConnectionManagerType_History));
END;
GO

/* --------------------------------------------------
-- Create Metadata Table: Connection
-------------------------------------------------- */
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.Connection') AND type IN (N'U'))
BEGIN
    CREATE TABLE Meta.Connection (
        ConnectionID INT IDENTITY(1, 1) NOT NULL
       ,ConnectionName VARCHAR(50) NOT NULL
       ,ConnectionDescription VARCHAR(1000) NULL
       ,ConnectionManagerTypeID SMALLINT NOT NULL
       ,ConnectionString VARCHAR(200) NOT NULL /* (FlatFile ? FilePath : ConnectionString) */
       ,ServerName VARCHAR(50) NULL
       ,DatabaseName VARCHAR(50) NULL
       ,SSISCreateInProject BIT NULL /* (0 = ConnectionManager in SSIS Package / 1 = ConnectionManager in SSIS Project) */
       ,SSISParameterize BIT NULL
       ,SSISParameterIsRequired BIT NULL
       ,SSISParameterIsSensitive BIT NULL
       ,ValidFrom DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL
       ,ValidTo DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL
       ,PERIOD FOR SYSTEM_TIME(ValidFrom, ValidTo)
       ,CONSTRAINT PK_Connection PRIMARY KEY (ConnectionID)
       ,CONSTRAINT UQ_Connection UNIQUE (ConnectionName)
       ,CONSTRAINT FK_Connection_ConnectionManagerType FOREIGN KEY (ConnectionManagerTypeID) REFERENCES Meta.ConnectionManagerType (ConnectionManagerTypeID)
    )
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Meta.Connection_History));
END;
GO

/* --------------------------------------------------
-- Create Metadata Table: ProjectType
-------------------------------------------------- */
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.ProjectType') AND type IN (N'U'))
BEGIN
    CREATE TABLE Meta.ProjectType (
        ProjectTypeID SMALLINT IDENTITY(1, 1) NOT NULL
       ,ProjectType VARCHAR(20) NOT NULL
       ,ProjectTypeDescription VARCHAR(200) NULL
       ,ValidFrom DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL
       ,ValidTo DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL
       ,PERIOD FOR SYSTEM_TIME(ValidFrom, ValidTo)
       ,CONSTRAINT PK_ProjectType PRIMARY KEY (ProjectTypeID)
       ,CONSTRAINT UQ_ProjectType UNIQUE (ProjectType)
    )
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Meta.ProjectType_History));
END;
GO

/* --------------------------------------------------
-- Create Metadata Table: Project
-------------------------------------------------- */
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.Project') AND type IN (N'U'))
BEGIN
    CREATE TABLE Meta.Project (
        ProjectID INT IDENTITY(1, 1) NOT NULL
       ,ProjectName VARCHAR(50) NOT NULL
       ,ProjectDescription VARCHAR(1000) NULL
       ,ProjectTypeID SMALLINT NOT NULL
       ,SourceConnectionID INT NOT NULL
       ,DestinationConnectionID INT NOT NULL
       ,DestinationSchemaName VARCHAR(10) NULL
       ,ValidFrom DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL
       ,ValidTo DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL
       ,PERIOD FOR SYSTEM_TIME(ValidFrom, ValidTo)
       ,CONSTRAINT PK_Project PRIMARY KEY (ProjectID)
       ,CONSTRAINT UQ_Project UNIQUE (ProjectName)
       ,CONSTRAINT FK_Project_ProjectType FOREIGN KEY (ProjectTypeID) REFERENCES Meta.ProjectType (ProjectTypeID)
       ,CONSTRAINT FK_Project_SourceConnection FOREIGN KEY (SourceConnectionID) REFERENCES Meta.Connection(ConnectionID)
       ,CONSTRAINT FK_Project_DestinationConnection FOREIGN KEY (DestinationConnectionID) REFERENCES Meta.Connection(ConnectionID)
    )
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Meta.Project_History));
END;
GO

/* --------------------------------------------------
-- Create Metadata Views
-------------------------------------------------- */
CREATE OR ALTER VIEW Meta.vConnection
AS
    SELECT
       c.ConnectionName
       ,cmt.ConnectionManagerType
       ,c.ConnectionString
       ,c.ServerName
       ,c.DatabaseName
       ,IIF(c.SSISCreateInProject = 1, 'true', 'false') AS SSISCreateInProject
       ,IIF(c.SSISParameterize = 1, 'true', 'false') AS SSISParameterize
       ,IIF(c.SSISParameterIsRequired = 1, 'true', 'false') AS SSISParameterIsRequired
       ,IIF(c.SSISParameterIsSensitive = 1, 'true', 'false') AS SSISParameterIsSensitive
    FROM Meta.Connection AS c
    INNER JOIN Meta.ConnectionManagerType AS cmt ON c.ConnectionManagerTypeID = cmt.ConnectionManagerTypeID
    ;
GO

CREATE OR ALTER VIEW Meta.vProject
AS
    SELECT
        p.ProjectID
       ,p.ProjectName
       ,pt.ProjectType
       ,sc.ConnectionName AS SourceConnectionName
       ,dc.ConnectionName AS DestinationConnectionName
       ,p.DestinationSchemaName
    FROM Meta.Project AS p
    INNER JOIN Meta.ProjectType AS pt ON p.ProjectTypeID = pt.ProjectTypeID
    INNER JOIN Meta.Connection AS sc ON p.SourceConnectionID = sc.ConnectionID
    INNER JOIN Meta.Connection AS dc ON p.DestinationConnectionID = dc.ConnectionID
    ;
GO