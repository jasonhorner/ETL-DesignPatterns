USE SSISDB;
GO

/* --------------------------------------------------
-- Create Variables
-------------------------------------------------- */
DECLARE
    @BaseName NVARCHAR(128)
   ,@BaseDescription NVARCHAR(MAX)
   ,@FolderName NVARCHAR(128)
   ,@FolderDescription NVARCHAR(MAX)
   ,@EnvironmentName NVARCHAR(128)
   ,@EnvironmentDescription NVARCHAR(MAX);

SET @BaseName = N'ETLDesignPatterns';
SET @BaseDescription = N'Jason Horner and Cathrine Wilhelmsen''s ETL Design Patterns Precon';

SET @FolderName = @BaseName;
SET @FolderDescription = N'Folder for ' + @BaseDescription;

SET @EnvironmentName = @BaseName;
SET @EnvironmentDescription = N'Environment for ' + @BaseDescription;

/* --------------------------------------------------
-- Create Folder
-------------------------------------------------- */
EXEC catalog.create_folder 
    @folder_name = @FolderName;

EXEC catalog.set_folder_description 
    @folder_name = @FolderName
    ,@folder_description = @FolderDescription;

/* --------------------------------------------------
-- Create Environment
-------------------------------------------------- */
EXEC catalog.create_environment 
    @folder_name = @FolderName
    ,@environment_name = @EnvironmentName
    ,@environment_description = @EnvironmentDescription;

EXEC catalog.set_environment_property
    @folder_name = @FolderName
    ,@environment_name = @EnvironmentName
    ,@property_name = N'Description'
    ,@property_value = @EnvironmentDescription;

/* --------------------------------------------------
-- Create Environment Variables
-------------------------------------------------- */
/* Common */
EXEC catalog.create_environment_variable
    @folder_name = @FolderName
    ,@environment_name = @EnvironmentName
    ,@variable_name = N'ConnectionManagerAdminConnectionString'
    ,@value = N'Data Source=.;Initial Catalog=Admin;Provider=SQLNCLI11.1;Integrated Security=SSPI;'
    ,@sensitive = False
    ,@data_type = N'String';

EXEC catalog.create_environment_variable
    @folder_name = @FolderName
    ,@environment_name = @EnvironmentName
    ,@variable_name = N'ConnectionManagerAuditingConnectionString'
    ,@value = N'Data Source=.;Initial Catalog=Admin;Provider=SQLNCLI11.1;Integrated Security=SSPI;'
    ,@sensitive = False
    ,@data_type = N'String';

EXEC catalog.create_environment_variable
    @folder_name = @FolderName
    ,@environment_name = @EnvironmentName
    ,@variable_name = N'ConnectionManagerMetadataConnectionString'
    ,@value = N'Data Source=.;Initial Catalog=Admin;Provider=SQLNCLI11.1;Integrated Security=SSPI;'
    ,@sensitive = False
    ,@data_type = N'String';

EXEC catalog.create_environment_variable
    @folder_name = @FolderName
    ,@environment_name = @EnvironmentName
    ,@variable_name = N'ConnectionManagerStagingConnectionString'
    ,@value = N'Data Source=.;Initial Catalog=Staging;Provider=SQLNCLI11.1;Integrated Security=SSPI;'
    ,@sensitive = False
    ,@data_type = N'String';

/* Specific Sources */
EXEC catalog.create_environment_variable
    @folder_name = @FolderName
    ,@environment_name = @EnvironmentName
    ,@variable_name = N'ConnectionManagerAWConnectionString'
    ,@value = N'Data Source=.;Initial Catalog=AdventureWorks;Provider=SQLNCLI11.1;Integrated Security=SSPI;'
    ,@sensitive = False
    ,@data_type = N'String';
    
EXEC catalog.create_environment_variable
    @folder_name = @FolderName
    ,@environment_name = @EnvironmentName
    ,@variable_name = N'ConnectionManagerAWDWConnectionString'
    ,@value = N'Data Source=.;Initial Catalog=AdventureWorksDW;Provider=SQLNCLI11.1;Integrated Security=SSPI;'
    ,@sensitive = False
    ,@data_type = N'String';
    
EXEC catalog.create_environment_variable
    @folder_name = @FolderName
    ,@environment_name = @EnvironmentName
    ,@variable_name = N'ConnectionManagerAWLTConnectionString'
    ,@value = N'Data Source=.;Initial Catalog=AdventureWorksLT;Provider=SQLNCLI11.1;Integrated Security=SSPI;'
    ,@sensitive = False
    ,@data_type = N'String';
    
EXEC catalog.create_environment_variable
    @folder_name = @FolderName
    ,@environment_name = @EnvironmentName
    ,@variable_name = N'ConnectionManagerWWIConnectionString'
    ,@value = N'Data Source=.;Initial Catalog=WideWorldImporters;Provider=SQLNCLI11.1;Integrated Security=SSPI;'
    ,@sensitive = False
    ,@data_type = N'String';
    
EXEC catalog.create_environment_variable
    @folder_name = @FolderName
    ,@environment_name = @EnvironmentName
    ,@variable_name = N'ConnectionManagerWWIDWConnectionString'
    ,@value = N'Data Source=.;Initial Catalog=WideWorldImportersDW;Provider=SQLNCLI11.1;Integrated Security=SSPI;'
    ,@sensitive = False
    ,@data_type = N'String';