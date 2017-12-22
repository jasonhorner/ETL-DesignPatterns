USE Admin;
GO

/* --------------------------------------------------
-- Create Schemas
-------------------------------------------------- */
DECLARE @query nvarchar(4000);
SET @query = 'CREATE SCHEMA [Meta] AUTHORIZATION [dbo];';
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Meta')
EXEC(@query);
GO



/* --------------------------------------------------
-- Cleanup
-------------------------------------------------- */
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.vItemColumn') AND type IN (N'V'))
	DROP VIEW Meta.vItemColumn;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.vItem') AND type IN (N'V'))
	DROP VIEW Meta.vItem;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.vProject') AND type IN (N'V'))
	DROP VIEW Meta.vProject;
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

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.ItemColumn') AND type IN (N'U'))
BEGIN
    ALTER TABLE Meta.ItemColumn SET (SYSTEM_VERSIONING = OFF);
    DROP TABLE Meta.ItemColumn_History;
    DROP TABLE Meta.ItemColumn;
END

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.Item') AND type IN (N'U'))
BEGIN
    ALTER TABLE Meta.Item SET (SYSTEM_VERSIONING = OFF);
    DROP TABLE Meta.Item_History;
    DROP TABLE Meta.Item;
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.Project') AND type IN (N'U'))
BEGIN
    ALTER TABLE Meta.Project SET (SYSTEM_VERSIONING = OFF);
    DROP TABLE Meta.Project_History;
    DROP TABLE Meta.Project;
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.ProjectType') AND type IN (N'U'))
BEGIN
    DROP TABLE Meta.ProjectType;
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.Connection') AND type IN (N'U'))
BEGIN
    ALTER TABLE Meta.Connection SET (SYSTEM_VERSIONING = OFF);
    DROP TABLE Meta.Connection_History;
    DROP TABLE Meta.Connection;
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.ConnectionManagerType') AND type IN (N'U'))
BEGIN
    DROP TABLE Meta.ConnectionManagerType;
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.ConnectionType') AND type IN (N'U'))
BEGIN
    DROP TABLE Meta.ConnectionType;
END
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
       ,CONSTRAINT PK_ConnectionType PRIMARY KEY (ConnectionTypeID)
       ,CONSTRAINT UQ_ConnectionTypeCode UNIQUE (ConnectionType)
    );
END;
GO

INSERT INTO Meta.ConnectionType (
    ConnectionType
)
VALUES
    ('Admin') /* For Configurations */
   ,('Auditing') /* For Custom Logging */
   ,('ETL') /* For Sources and Destinations */
   ,('Logging') /* For Standard Logging */
   ,('Metadata') /* For Metadata Management */
;
GO

-- SELECT * FROM Meta.ConnectionType



/* --------------------------------------------------
-- Create Metadata Table: ConnectionManagerType
-------------------------------------------------- */
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.ConnectionManagerType') AND type IN (N'U'))
BEGIN
    CREATE TABLE Meta.ConnectionManagerType (
        ConnectionManagerTypeID SMALLINT IDENTITY(1, 1) NOT NULL
       ,ConnectionManagerType VARCHAR(20) NOT NULL
       ,ConnectionManagerTypeDescription VARCHAR(200) NULL
       ,CONSTRAINT PK_ConnectionManagerType PRIMARY KEY (ConnectionManagerTypeID)
       ,CONSTRAINT UQ_ConnectionManagerType UNIQUE (ConnectionManagerType)
    );
END;
GO

INSERT INTO Meta.ConnectionManagerType (
    ConnectionManagerType
)
VALUES
    ('AdoNet')
   ,('Excel')
   ,('FlatFile')
   ,('OleDb')
;
GO

-- SELECT * FROM Meta.ConnectionManagerType



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

INSERT INTO Meta.Connection (
     ConnectionName
    ,ConnectionTypeID
    ,ConnectionManagerTypeID
    ,ConnectionString
    ,DatabaseName
    ,SSISCreateInProject
    ,SSISParameterize
    ,SSISParameterIsRequired
    ,SSISParameterIsSensitive
)
VALUES
     ('Auditing', 2, 4, 'Data Source=.;Initial Catalog=Staging;Provider=SQLNCLI11.1;Integrated Security=SSPI;'             , 'Staging'             , 1, 1, 1, 0)
    ,('Staging' , 3, 4, 'Data Source=.;Initial Catalog=Staging;Provider=SQLNCLI11.1;Integrated Security=SSPI;'             , 'Staging'             , 1, 1, 1, 0)
    ,('AW'      , 3, 4, 'Data Source=.;Initial Catalog=AdventureWorks;Provider=SQLNCLI11.1;Integrated Security=SSPI;'      , 'AdventureWorks'      , 1, 1, 1, 0)
    ,('AWDW'    , 3, 4, 'Data Source=.;Initial Catalog=AdventureWorksDW;Provider=SQLNCLI11.1;Integrated Security=SSPI;'    , 'AdventureWorksDW'    , 1, 1, 1, 0)
    ,('AWLT'    , 3, 4, 'Data Source=.;Initial Catalog=AdventureWorksLT;Provider=SQLNCLI11.1;Integrated Security=SSPI;'    , 'AdventureWorksLT'    , 1, 1, 1, 0)
    ,('WWI'     , 3, 4, 'Data Source=.;Initial Catalog=WideWorldImporters;Provider=SQLNCLI11.1;Integrated Security=SSPI;'  , 'WideWorldImporters'  , 1, 1, 1, 0)
    ,('WWIDW'   , 3, 4, 'Data Source=.;Initial Catalog=WideWorldImportersDW;Provider=SQLNCLI11.1;Integrated Security=SSPI;', 'WideWorldImportersDW', 1, 1, 1, 0)
;
GO

-- SELECT * FROM Meta.Connection;



/* --------------------------------------------------
-- Create Metadata Table: Project
-------------------------------------------------- */
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Meta.Project') AND type IN (N'U'))
BEGIN
    CREATE TABLE Meta.Project (
        ProjectID                   INT           IDENTITY(1, 1) NOT NULL
       ,ProjectName                 VARCHAR(50)   NOT NULL
       ,ProjectDescription          VARCHAR(1000) NULL
       ,ProjectType                 VARCHAR(10)   NOT NULL /* (STG / DWH / DM) */
       ,SourceConnectionID          INT           NOT NULL
       ,DestinationConnectionID     INT           NOT NULL
       ,DestinationSchemaName       VARCHAR(10)   NOT NULL
       ,ValidFrom                   DATETIME2     GENERATED ALWAYS AS ROW START HIDDEN NOT NULL
       ,ValidTo                     DATETIME2     GENERATED ALWAYS AS ROW END HIDDEN NOT NULL
       ,PERIOD FOR SYSTEM_TIME(ValidFrom, ValidTo)
       ,CONSTRAINT PK_Project PRIMARY KEY (ProjectID)
       ,CONSTRAINT UQ_Project UNIQUE (ProjectName)
       ,CONSTRAINT FK_Project_SourceConnection FOREIGN KEY (SourceConnectionID) REFERENCES Meta.Connection(ConnectionID)
       ,CONSTRAINT FK_Project_DestinationConnection FOREIGN KEY (DestinationConnectionID) REFERENCES Meta.Connection(ConnectionID)
    )
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Meta.Project_History));
END
GO

INSERT INTO Meta.Project (
    ProjectName
   ,ProjectType
   ,SourceConnectionID
   ,DestinationConnectionID
   ,DestinationSchemaName
)
VALUES
     ('Staging AdventureWorks'      , 'STG', 5, 4, 'AWSRC')
    ,('Staging AdventureWorksDW'    , 'STG', 6, 4, 'AWDWSRC')
    ,('Staging AdventureWorksLT'    , 'STG', 7, 4, 'AWLTSRC')
    ,('Staging WideWorldImporters'  , 'STG', 8, 4, 'WWISRC')
    ,('Staging WideWorldImportersDW', 'STG', 9, 4, 'WWIDWSRC')
;
GO

-- SELECT * FROM Meta.Project;



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
END
GO

INSERT INTO Meta.Item (
	ItemName
	,ItemType
	,ProjectID
	,SSISLoadPattern
) VALUES
	('Customer', 'T', 3, 'TruncLoad')
;
GO

-- SELECT * FROM Meta.Item



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

INSERT INTO Meta.ItemColumn (
    ItemID
   ,Ordinal
   ,ItemColumnName
   ,DataType
   ,DataTypeLength
   ,DataTypePrecision
   ,DataTypeScale
   ,DerivedColumnReplaceExisting
   ,DerivedColumnExpression
)
VALUES
     (1, 1, 'CustomerId', 'Int32', 0, 0, 0, 0, '')
    ,(1, 2, 'Firstname', 'AnsiString', 50, 0, 0, 0, '')
    ,(1, 3, 'LastName', 'AnsiString', 50, 0, 0, 0, '')
    ,(1, 4, 'EmailAddress', 'AnsiString', 50, 0, 0, 0, '')
;
GO

-- SELECT * FROM Meta.ItemColumn;



/* --------------------------------------------------
-- Create Metadata Views
-------------------------------------------------- */
CREATE VIEW Meta.vConnectionType
AS
SELECT ct.ConnectionType
FROM Meta.ConnectionType AS ct;
GO

CREATE VIEW Meta.vConnectionManagerType
AS
SELECT cmt.ConnectionManagerType
FROM Meta.ConnectionManagerType AS cmt;
GO

CREATE VIEW Meta.vConnection
AS
SELECT
    c.ConnectionName
   ,ct.ConnectionType
   ,cmt.ConnectionManagerType
   ,c.ConnectionString
   ,c.DatabaseName
   ,c.SSISCreateInProject
   ,c.SSISParameterize
   ,c.SSISParameterIsRequired
   ,c.SSISParameterIsSensitive
FROM Meta.Connection AS c
INNER JOIN Meta.ConnectionType AS ct ON c.ConnectionTypeID = ct.ConnectionTypeID
INNER JOIN Meta.ConnectionManagerType AS cmt ON c.ConnectionManagerTypeID = cmt.ConnectionManagerTypeID
;
GO

CREATE VIEW Meta.vProject
AS
SELECT
    p.ProjectName
   ,p.ProjectType
   ,sc.ConnectionName AS SourceConnectionName
   ,dc.ConnectionName AS DestinationConnectionName
   ,p.DestinationSchemaName
FROM Meta.Project AS p
INNER JOIN Meta.Connection AS sc ON p.SourceConnectionID = sc.ConnectionID
INNER JOIN Meta.Connection AS dc ON p.DestinationConnectionID = dc.ConnectionID
;
GO

CREATE VIEW Meta.vItem AS
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

CREATE VIEW Meta.vItemColumn AS
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