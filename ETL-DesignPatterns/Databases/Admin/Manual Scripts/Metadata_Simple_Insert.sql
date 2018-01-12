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
   ,('ProductSales', 3, 'C:\Users\cathr\Documents\GitHub\jasonhorner\ETL-DesignPatterns\ETL-DesignPatterns\ETL\3-Staging-FlatFiles\', NULL, NULL, 0, 1, 1, 0)
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
     ('AdventureWorks Staging'      , 1, 5,  4, 'AWSRC')
    ,('AdventureWorksDW Staging'    , 1, 6,  4, 'AWDWSRC')
    ,('AdventureWorksLT Staging'    , 1, 7,  4, 'AWLTSRC')
    ,('WideWorldImporters Staging'  , 1, 8,  4, 'WWISRC')
    ,('WideWorldImportersDW Staging', 1, 9,  4, 'WWIDWSRC')
    ,('ProductSales Staging'        , 1, 10, 4, 'PSSRC')
;
GO

/* --------------------------------------------------
-- Insert Metadata: ItemType
-------------------------------------------------- */
INSERT INTO Meta.ItemType (
    ItemType
)
VALUES
     ('Table')
    ,('FlatFile')
    ,('Excel')
;
GO

/* --------------------------------------------------
-- Insert Metadata: Item
-------------------------------------------------- */
INSERT INTO Meta.Item (
    ItemName
   ,ItemTypeID
   ,ConnectionID
   ,ProjectID
   ,FlatFileExtension
   ,FlatFileType
   ,FlatFileIsUnicode
   ,FlatFileHeaderRowDelimiter
   ,FlatFileHeaderRowsToSkip
   ,FlatFileColumnNamesInFirstDataRow
   ,FlatFileColumnDelimiter
   ,FlatFileRowDelimiter
)
VALUES
    ('Products', 2, 10, 6, '.csv', 'Delimited', 0, 'CRLF', 0, 1, 'Comma', 'CRLF')
   ,('Sales', 2, 10, 6, '.csv', 'Delimited', 0, 'CRLF', 0, 1, 'Comma', 'CRLF')
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
   ,IsNullable
   ,IsPrimaryKey
   ,IsIdentity
   ,DerivedColumnReplaceExisting
   ,DerivedColumnExpression
)
VALUES
     (1, 1, 'ProductID', 'AnsiString', 25, -1, -1, 0, 1, 0, 0, '')
    ,(1, 2, 'ProductName', 'AnsiString', 50, -1, -1, 1, 0, 0, 0, '')
    ,(1, 3, 'StandardCost', 'Decimal', 0, 10, 2, 1, 0, 0, 0, '')
    ,(1, 4, 'ListPrice', 'Decimal', 0, 10, 2, 1, 0, 0, 0, '')
	
    ,(2, 1,  'SalesID', 'Int32', 0, -1, -1, 0, 1, 0, 0, '')
    ,(2, 2,  'FirstName', 'AnsiString', 100, -1, -1, 1, 0, 0, 0, '')
    ,(2, 3,  'LastName', 'AnsiString', 100, -1, -1, 1, 0, 0, 0, '')
    ,(2, 4,  'Email', 'AnsiString', 100, -1, -1, 1, 0, 0, 0, '')
    ,(2, 5,  'Birthdate', 'Date', 0, -1, -1, 1, 0, 0, 0, '')
    ,(2, 6,  'Gender', 'AnsiString', 10, -1, -1, 1, 0, 0, 0, '')
    ,(2, 7,  'IPAdress', 'AnsiString', 16, -1, -1, 1, 0, 0, 0, '')
    ,(2, 8,  'CountryCode', 'AnsiString', 2, -1, -1, 1, 0, 0, 0, '')
    ,(2, 9,  'CountryName', 'AnsiString', 50, -1, -1, 1, 0, 0, 0, '')
    ,(2, 10, 'StateCode', 'AnsiString', 2, -1, -1, 1, 0, 0, 0, '')
    ,(2, 11, 'StateName', 'AnsiString', 50, -1, -1, 1, 0, 0, 0, '')
    ,(2, 12, 'City', 'AnsiString', 50, -1, -1, 1, 0, 0, 0, '')
    ,(2, 13, 'PostalCode', 'AnsiString', 10, -1, -1, 1, 0, 0, 0, '')
    ,(2, 14, 'Address', 'AnsiString', 100, -1, -1, 1, 0, 0, 0, '')
    ,(2, 15, 'CreditCardType', 'AnsiString', 20, -1, -1, 1, 0, 0, 0, '')
    ,(2, 16, 'CreditCardNumber', 'AnsiString', 16, -1, -1, 1, 0, 0, 0, '')
    ,(2, 17, 'Quantity', 'Int32', 0, -1, -1, 1, 0, 0, 0, '')
    ,(2, 18, 'SalesDate', 'Date', 0, -1, -1, 1, 0, 0, 0, '')
    ,(2, 19, 'ProductNumber', 'AnsiString', 25, -1, -1, 1, 0, 0, 0, '')
    ,(2, 20, 'SalesAmount', 'Decimal', 0, 10, 2, 1, 0, 0, 0, '')
;
GO

/*
id
first_name
last_name
email
birthdate
gender
ip_address
country_code
country
state_code
STATE
city
postal_code
ADDRESS
credit_card_type
credit_card_number
quantity
sales_date
product_code
cost
*/