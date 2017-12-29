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
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.vItemColumn') AND type IN (N'V'))
	DROP VIEW Meta.vItemColumn;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.vItem') AND type IN (N'V'))
	DROP VIEW Meta.vItem;
GO

--IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.vProjectConnection') AND type IN (N'V'))
--	DROP VIEW Meta.vProjectConnection;
--GO

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

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.vConnectionType') AND type IN (N'V'))
	DROP VIEW Meta.vConnectionType;
GO

/* --------------------------------------------------
-- Cleanup Tables
-------------------------------------------------- */
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.ItemColumn') AND type IN (N'U'))
BEGIN
    ALTER TABLE Meta.ItemColumn SET (SYSTEM_VERSIONING = OFF);
    DROP TABLE Meta.ItemColumn_History;
    DROP TABLE Meta.ItemColumn;
END;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.Item') AND type IN (N'U'))
BEGIN
    ALTER TABLE Meta.Item SET (SYSTEM_VERSIONING = OFF);
    DROP TABLE Meta.Item_History;
    DROP TABLE Meta.Item;
END;
GO

--IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.ProjectConnection') AND type IN (N'U'))
--BEGIN
--    ALTER TABLE Meta.ProjectConnection SET (SYSTEM_VERSIONING = OFF);
--    DROP TABLE Meta.ProjectConnection_History;
--    DROP TABLE Meta.ProjectConnection;
--END;
--GO

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

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.ConnectionType') AND type IN (N'U'))
BEGIN
    ALTER TABLE Meta.ConnectionType SET (SYSTEM_VERSIONING = OFF);
    DROP TABLE Meta.ConnectionType_History;
    DROP TABLE Meta.ConnectionType;
END;
GO



/* --------------------------------------------------
-- Create Metadata Table: ConnectionType
-------------------------------------------------- */
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.ConnectionType') AND type IN (N'U'))
BEGIN
    CREATE TABLE Meta.ConnectionType (
        ConnectionTypeID SMALLINT IDENTITY(1, 1) NOT NULL
       ,ConnectionType VARCHAR(20) NOT NULL
       ,ConnectionTypeDescription VARCHAR(200) NULL
       ,ValidFrom DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL
       ,ValidTo DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL
       ,PERIOD FOR SYSTEM_TIME(ValidFrom, ValidTo)
       ,CONSTRAINT PK_ConnectionType PRIMARY KEY (ConnectionTypeID)
       ,CONSTRAINT UQ_ConnectionType UNIQUE (ConnectionType)
    )
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Meta.ConnectionType_History));
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
       ,ConnectionTypeID SMALLINT NOT NULL
       ,ConnectionManagerTypeID SMALLINT NOT NULL
       ,ConnectionString VARCHAR(200) NOT NULL /* (FlatFile ? FilePath : ConnectionString) */
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
       ,CONSTRAINT FK_Connection_ConnectionType FOREIGN KEY (ConnectionTypeID) REFERENCES Meta.ConnectionType (ConnectionTypeID)
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

--/* --------------------------------------------------
---- Create Metadata Table: ProjectConnection
---------------------------------------------------- */
--IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.ProjectConnection') AND type IN (N'U'))
--BEGIN
--    CREATE TABLE Meta.ProjectConnection (
--        ProjectConnectionID INT IDENTITY(1, 1) NOT NULL
--       ,ProjectID INT NOT NULL
--       ,SourceConnectionID INT NOT NULL
--       ,DestinationConnectionID INT NOT NULL
--       ,DestinationSchemaName VARCHAR(20) NOT NULL
--       ,ValidFrom DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN NOT NULL
--       ,ValidTo DATETIME2 GENERATED ALWAYS AS ROW END HIDDEN NOT NULL
--       ,PERIOD FOR SYSTEM_TIME(ValidFrom, ValidTo)
--       ,CONSTRAINT PK_ProjectConnection PRIMARY KEY (ProjectConnectionID)
--       ,CONSTRAINT FK_ProjectConnection_Project FOREIGN KEY (ProjectID) REFERENCES Meta.Project (ProjectID)
--       ,CONSTRAINT FK_ProjectConnection_SourceConnection FOREIGN KEY (SourceConnectionID) REFERENCES Meta.Connection (ConnectionID)
--       ,CONSTRAINT FK_ProjectConnection_DestinationConnection FOREIGN KEY (DestinationConnectionID) REFERENCES Meta.Connection (ConnectionID)
--    )
--    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Meta.ProjectConnection_History));
--END;
--GO

/* --------------------------------------------------
-- Create Metadata Table: Item
-------------------------------------------------- */
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.Item') AND type IN (N'U'))
BEGIN
    CREATE TABLE Meta.Item (
        ItemID                            INT           IDENTITY(1, 1) NOT NULL
       ,ItemName                          VARCHAR(100)  NOT NULL
       ,ItemDescription                   VARCHAR(1000) NULL
       ,ItemType                          CHAR(1)       NOT NULL /* T = Table, F = FlatFile, V = View */
       ,ProjectID                         INT           NOT NULL
       ,TableCompressionType              VARCHAR(5)    NULL
       ,TableLateArriving                 BIT           NULL
       ,TableExternalPartitionScheme      VARCHAR(50)   NULL
       ,TablePartitionSchemeName          VARCHAR(50)   NULL
       ,TablePartitionColumnName          VARCHAR(50)   NULL
       ,FlatFileExtension                 VARCHAR(10)   NULL
       ,FlatFileType                      VARCHAR(15)   NULL     /* Default Biml: Delimited (Delimited, FixedWidth or RaggedRight https://varigence.com/Documentation/Api/Enum/FlatFileType) */
       ,FlatFileIsUnicode                 BIT           NULL     /* Default Biml: True */
       ,FlatFileLocale                    VARCHAR(15)   NULL     /* https://www.varigence.com/Documentation/Api/Enum/Language */
       ,FlatFileCodePage                  INT           NULL     /* Default Biml: 0 */
       ,FlatFileTextQualifer              VARCHAR(15)   NULL
       ,FlatFileHeaderRowDelimiter        VARCHAR(15)   NULL     /* Default Biml: CRLF */
       ,FlatFileHeaderRowsToSkip          INT           NULL     /* Default Biml: 0 */
       ,FlatFileColumnNamesInFirstDataRow BIT           NULL     /* Default Biml: False */
       ,FlatFileColumnDelimiter           VARCHAR(15)   NULL
       ,FlatFileRowDelimiter              VARCHAR(15)   NULL
       ,FlatFileDataRowsToSkip            INT           NULL     /* Default Biml: 0 */
       ,SSISLoadPattern                   VARCHAR(20)   NULL     /* TruncLoad / Incremental / Dim / FactSnap / FactTrans */
       ,SSISParallelDataFlows             TINYINT       NULL
       ,SSISParallelDataFlowsColumn       VARCHAR(50)   NULL
       ,ValidFrom                   DATETIME2     GENERATED ALWAYS AS ROW START HIDDEN NOT NULL
       ,ValidTo                     DATETIME2     GENERATED ALWAYS AS ROW END HIDDEN NOT NULL
       ,PERIOD FOR SYSTEM_TIME(ValidFrom, ValidTo)
       ,CONSTRAINT PK_Item PRIMARY KEY (ItemID)
       ,CONSTRAINT UQ_Item UNIQUE (ItemName)
       ,CONSTRAINT FK_Item_Project FOREIGN KEY (ProjectID) REFERENCES Meta.Project(ProjectID)
    )
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Meta.Item_History));
END;
GO

/* --------------------------------------------------
-- Create Metadata Table: ItemColumn
-------------------------------------------------- */
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.ItemColumn') AND type IN (N'U'))
BEGIN
    CREATE TABLE Meta.ItemColumn (
        ItemColumnID                 INT           IDENTITY(1, 1) NOT NULL
       ,ItemColumnName               VARCHAR(100)  NOT NULL
       ,ItemID                       INT           NOT NULL
       ,Ordinal                      INT           NOT NULL
       ,DataType                     VARCHAR(25)   NOT NULL
       ,DataTypeLength               INT           NULL
       ,DataTypePrecision            INT           NULL
       ,DataTypeScale                INT           NULL
       ,ChangeType                   VARCHAR(10)   NULL
       ,IsNullable                   BIT           NULL
       ,IsPrimaryKey                 BIT           NULL
       ,IsIdentity                   BIT           NULL
       ,DerivedColumnReplaceExisting BIT           NULL
       ,DerivedColumnExpression      VARCHAR(1000) NULL
       ,ItemColumnDescription        VARCHAR(1000) NULL
       ,ValidFrom                    DATETIME2     GENERATED ALWAYS AS ROW START HIDDEN NOT NULL
       ,ValidTo                      DATETIME2     GENERATED ALWAYS AS ROW END HIDDEN NOT NULL
       ,PERIOD FOR SYSTEM_TIME(ValidFrom, ValidTo)
       ,CONSTRAINT PK_ItemColumn PRIMARY KEY (ItemColumnID)
       ,CONSTRAINT UQ_ItemColumnOrdinal UNIQUE (ItemID, Ordinal)
       ,CONSTRAINT FK_Item FOREIGN KEY (ItemID) REFERENCES Meta.Item (ItemID)
    )
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Meta.ItemColumn_History));
END;
GO



/* --------------------------------------------------
-- Create Metadata Views
-------------------------------------------------- */
CREATE OR ALTER VIEW Meta.vConnectionType
AS
    SELECT ct.ConnectionType
    FROM Meta.ConnectionType AS ct;
GO

CREATE OR ALTER VIEW Meta.vConnectionManagerType
AS
    SELECT cmt.ConnectionManagerType
    FROM Meta.ConnectionManagerType AS cmt;
GO

CREATE OR ALTER VIEW Meta.vConnection
AS
    SELECT
       c.ConnectionName
       ,ct.ConnectionType
       ,cmt.ConnectionManagerType
       ,c.ConnectionString
       ,c.DatabaseName
       ,IIF(c.SSISCreateInProject = 1, 'true', 'false') AS SSISCreateInProject
       ,IIF(c.SSISParameterize = 1, 'true', 'false') AS SSISParameterize
       ,IIF(c.SSISParameterIsRequired = 1, 'true', 'false') AS SSISParameterIsRequired
       ,IIF(c.SSISParameterIsSensitive = 1, 'true', 'false') AS SSISParameterIsSensitive
    FROM Meta.Connection AS c
    INNER JOIN Meta.ConnectionType AS ct ON c.ConnectionTypeID = ct.ConnectionTypeID
    INNER JOIN Meta.ConnectionManagerType AS cmt ON c.ConnectionManagerTypeID = cmt.ConnectionManagerTypeID
    ;
GO

CREATE OR ALTER VIEW Meta.vProjectType
AS
    SELECT pt.ProjectType
    FROM Meta.ProjectType AS pt;
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

--CREATE OR ALTER VIEW Meta.vProjectConnection
--AS
--    SELECT
--       p.ProjectName
--       ,pt.ProjectType
--       ,sc.ConnectionName AS SourceConnectionName
--       ,scmt.ConnectionManagerType AS SourceConnectionManagerType
--       ,sc.ConnectionString AS SourceConnectionString
--       ,sc.DatabaseName AS SourceDatabaseName
--       ,dc.ConnectionName AS DestinationConnectionName
--       ,dcmt.ConnectionManagerType AS DestinationConnectionManagerType
--       ,dc.ConnectionString AS DestinationConnectionString
--       ,dc.DatabaseName AS DestinationDatabaseName
--       ,pc.DestinationSchemaName
--    FROM Meta.ProjectConnection AS pc
--    INNER JOIN Meta.Project AS p ON pc.ProjectID = p.ProjectID
--    INNER JOIN Meta.ProjectType AS pt ON p.ProjectTypeID = pt.ProjectTypeID
--    INNER JOIN Meta.Connection AS sc ON pc.SourceConnectionID = sc.ConnectionID
--    INNER JOIN Meta.ConnectionType AS sct ON sc.ConnectionTypeID = sct.ConnectionTypeID
--    INNER JOIN Meta.ConnectionManagerType AS scmt ON sc.ConnectionManagerTypeID = scmt.ConnectionManagerTypeID
--    INNER JOIN Meta.Connection AS dc ON pc.DestinationConnectionID = dc.ConnectionID
--    INNER JOIN Meta.ConnectionType AS dct ON dc.ConnectionTypeID = dct.ConnectionTypeID
--    INNER JOIN Meta.ConnectionManagerType AS dcmt ON dc.ConnectionManagerTypeID = dcmt.ConnectionManagerTypeID
--    ;
--GO

CREATE OR ALTER VIEW Meta.vItem AS
    SELECT 
	    i.ItemName
	    ,i.ItemType
	    ,p.ProjectName
	    ,i.FlatFileExtension
	    ,i.FlatFileType
	    ,i.FlatFileIsUnicode
	    ,i.FlatFileColumnDelimiter
	    ,i.FlatFileRowDelimiter
	    ,i.SSISLoadPattern
	    ,i.SSISParallelDataFlows
	    ,i.SSISParallelDataFlowsColumn
    FROM Meta.Item AS i
    INNER JOIN Meta.Project p ON i.ProjectID = p.ProjectID
    ;
GO

CREATE OR ALTER VIEW Meta.vItemColumn AS
    SELECT 
	    i.ItemName
	    ,ic.ItemColumnName
	    ,CONCAT(i.ItemName,'_', ic.ItemColumnName) AS ScopedItemColumnName
	    ,ic.Ordinal
	    ,ic.ChangeType
	    ,ic.IsNullable
	    ,ic.IsPrimaryKey
	    ,ic.IsIdentity
	    ,ic.DataType
	    ,ic.DataTypeLength
	    ,ic.DataTypePrecision
	    ,ic.DataTypeScale
	    ,ic.DerivedColumnReplaceExisting
	    ,ic.DerivedColumnExpression
	    ,CONCAT(p.ProjectName, '/', i.ItemName) AS LogicalDisplayFolder
    FROM Meta.ItemColumn ic
    INNER JOIN Meta.Item i ON ic.ItemID = i.ItemID
    INNER JOIN Meta.Project p ON i.ProjectID = p.ProjectID
    ;
GO