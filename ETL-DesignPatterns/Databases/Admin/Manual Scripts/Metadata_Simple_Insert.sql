USE Admin;
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
   ,ConnectionManagerTypeID
   ,ConnectionString
   ,ServerName
   ,DatabaseName
   ,SSISCreateInProject
   ,SSISParameterize
   ,SSISParameterIsRequired
   ,SSISParameterIsSensitive
)
VALUES
    ('Admin', 4, 'Data Source=.;Initial Catalog=Admin;Provider=SQLNCLI11.1;Integrated Security=SSPI;', 'localhost', 'Admin', 1, 1, 1, 0)
   ,('Auditing', 4, 'Data Source=.;Initial Catalog=Admin;Provider=SQLNCLI11.1;Integrated Security=SSPI;', 'localhost', 'Admin', 1, 1, 1, 0)
   ,('DW', 4, 'Data Source=.;Initial Catalog=DW;Provider=SQLNCLI11.1;Integrated Security=SSPI;', 'localhost', 'DW', 1, 1, 1, 0)
   ,('Staging', 4, 'Data Source=.;Initial Catalog=Staging;Provider=SQLNCLI11.1;Integrated Security=SSPI;', 'localhost', 'Staging', 1, 1, 1, 0)
   ,('AW', 4, 'Data Source=.;Initial Catalog=AdventureWorks;Provider=SQLNCLI11.1;Integrated Security=SSPI;', 'localhost', 'AdventureWorks', 1, 1, 1, 0)
   ,('AWDW', 4, 'Data Source=.;Initial Catalog=AdventureWorksDW;Provider=SQLNCLI11.1;Integrated Security=SSPI;', 'localhost', 'AdventureWorksDW', 1, 1, 1, 0)
   ,('AWLT', 4, 'Data Source=.;Initial Catalog=AdventureWorksLT;Provider=SQLNCLI11.1;Integrated Security=SSPI;', 'localhost', 'AdventureWorksLT', 1, 1, 1, 0)
   ,('WWI', 4, 'Data Source=.;Initial Catalog=WideWorldImporters;Provider=SQLNCLI11.1;Integrated Security=SSPI;', 'localhost', 'WideWorldImporters', 1, 1, 1, 0)
   ,('WWIDW', 4, 'Data Source=.;Initial Catalog=WideWorldImportersDW;Provider=SQLNCLI11.1;Integrated Security=SSPI;', 'localhost', 'WideWorldImportersDW', 1, 1, 1, 0)
;
GO

/* --------------------------------------------------
-- Insert Metadata: ProjectType
-------------------------------------------------- */
INSERT INTO Meta.ProjectType (
    ProjectType
)
VALUES
     ('StagingTL')
    ,('StagingH')
    ,('StagingCDC')
    ,('StagingCT')
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
     ('AdventureWorks Staging'      , 1, 5, 4, 'AWSRC')
    ,('AdventureWorksDW Staging'    , 1, 6, 4, 'AWDWSRC')
    ,('AdventureWorksLT Staging'    , 1, 7, 4, 'AWLTSRC')
    ,('WideWorldImporters Staging'  , 1, 8, 4, 'WWISRC')
    ,('WideWorldImportersDW Staging', 1, 9, 4, 'WWIDWSRC')
;
GO