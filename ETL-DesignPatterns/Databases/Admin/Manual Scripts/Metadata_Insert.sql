USE Admin;
GO

/* --------------------------------------------------
-- Cleanup Data
-------------------------------------------------- */
--DELETE FROM Meta.ItemColumn;
--DELETE FROM Meta.Item;
--DELETE FROM Meta.ProjectConnection;
--DELETE FROM Meta.Project;
--DELETE FROM Meta.ProjectType;
--DELETE FROM Meta.Connection;
--DELETE FROM Meta.ConnectionManagerType;
--DELETE FROM Meta.ConnectionType;


/* --------------------------------------------------
-- Insert Metadata: ConnectionType
-------------------------------------------------- */
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

/* --------------------------------------------------
-- Insert Metadata: ConnectionManagerType
-------------------------------------------------- */
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

/* --------------------------------------------------
-- Insert Metadata: Connection
-------------------------------------------------- */
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
     ('DW'      , 3, 4, 'Data Source=.;Initial Catalog=DW;Provider=SQLNCLI11.1;Integrated Security=SSPI;'                  , 'DW'                  , 1, 1, 1, 0)
    ,('Staging' , 3, 4, 'Data Source=.;Initial Catalog=Staging;Provider=SQLNCLI11.1;Integrated Security=SSPI;'             , 'Staging'             , 1, 1, 1, 0)
    ,('AW'      , 3, 4, 'Data Source=.;Initial Catalog=AdventureWorks;Provider=SQLNCLI11.1;Integrated Security=SSPI;'      , 'AdventureWorks'      , 1, 1, 1, 0)
    ,('AWDW'    , 3, 4, 'Data Source=.;Initial Catalog=AdventureWorksDW;Provider=SQLNCLI11.1;Integrated Security=SSPI;'    , 'AdventureWorksDW'    , 1, 1, 1, 0)
    ,('AWLT'    , 3, 4, 'Data Source=.;Initial Catalog=AdventureWorksLT;Provider=SQLNCLI11.1;Integrated Security=SSPI;'    , 'AdventureWorksLT'    , 1, 1, 1, 0)
    ,('WWI'     , 3, 4, 'Data Source=.;Initial Catalog=WideWorldImporters;Provider=SQLNCLI11.1;Integrated Security=SSPI;'  , 'WideWorldImporters'  , 1, 1, 1, 0)
    ,('WWIDW'   , 3, 4, 'Data Source=.;Initial Catalog=WideWorldImportersDW;Provider=SQLNCLI11.1;Integrated Security=SSPI;', 'WideWorldImportersDW', 1, 1, 1, 0)
;
GO

/* --------------------------------------------------
-- Insert Metadata: ProjectType
-------------------------------------------------- */
INSERT INTO Meta.ProjectType (
    ProjectType
)
VALUES
     ('Staging')
    ,('Dimensional Model')
    ,('Data Mart')
;
GO

/* --------------------------------------------------
-- Insert Metadata: Project
-------------------------------------------------- */
INSERT INTO Meta.Project (
    ProjectName
   ,ProjectTypeID
   ,SourceConnectionID
   ,DestinationConnectionID
   ,DestinationSchemaName
)
VALUES
     ('AdventureWorks Staging'      , 1, 3, 2, 'AWSRC')
    ,('AdventureWorksDW Staging'    , 1, 4, 2, 'AWDWSRC')
    ,('AdventureWorksLT Staging'    , 1, 5, 2, 'AWLTSRC')
    ,('AdventureWorks DWH'          , 2, 2, 1, 'dw')
    ,('WideWorldImporters Staging'  , 1, 6, 2, 'WWISRC')
    ,('WideWorldImportersDW Staging', 1, 7, 2, 'WWIDWSRC')
    ,('WideWorldImporters DWH'      , 2, 2, 1, 'dw')
;
GO

/* --------------------------------------------------
-- Insert Metadata: ProjectConnection
-------------------------------------------------- */
--INSERT INTO Meta.ProjectConnection (
--    ProjectID
--   ,SourceConnectionID
--   ,DestinationConnectionID
--   ,DestinationSchemaName
--)
--VALUES
--    (1,3,2,'AWSRC')
--   ,(1,5,2,'AWLTSRC')
--   ,(2,2,1,'dw')
--   ,(4,6,2,'WWISRC')
--   ,(5,2,1,'dw')
--;

/* --------------------------------------------------
-- Insert Metadata: Item
-------------------------------------------------- */
INSERT INTO Meta.Item (
	ItemName
	,ItemType
	,ProjectID
	,SSISLoadPattern
) VALUES
	('Customer', 'T', 1, 'TruncLoad')
;
GO

/* --------------------------------------------------
-- Insert Metadata: ItemColumn
-------------------------------------------------- */
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