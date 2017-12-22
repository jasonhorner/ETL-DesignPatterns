USE SSISDB;
GO

/* --------------------------------------------------
-- Create Variables
-------------------------------------------------- */
DECLARE
    @BaseName NVARCHAR(128)
   ,@FolderName NVARCHAR(128)
   ,@EnvironmentName NVARCHAR(128)
   ,@ProjectName NVARCHAR(128)

SET @BaseName = N'ETLDesignPatterns';
SET @FolderName = @BaseName;
SET @EnvironmentName = @BaseName;
SET @ProjectName = N'1-BasicBiml';

/* --------------------------------------------------
-- Create Environment Reference
-------------------------------------------------- */
DECLARE @reference_id BIGINT;
EXEC catalog.create_environment_reference
    @folder_name = @FolderName
   ,@environment_name = @EnvironmentName
   ,@project_name = @ProjectName
   ,@reference_type = R
   ,@reference_id = @reference_id OUTPUT

/* --------------------------------------------------
-- Map Project Parameters
-- object_type: 20 = Project Parameter | 30 = Package Parameter
-- object_name: name of package, required when parameter is package parameter
-- value_type: V = Literal Value | R = Reference Value
-- https://docs.microsoft.com/en-us/sql/integration-services/system-stored-procedures/catalog-set-object-parameter-value-ssisdb-database
-------------------------------------------------- */
EXEC catalog.set_object_parameter_value
    @folder_name = @FolderName
   ,@project_name = @ProjectName
   ,@object_type = 20
   ,@value_type = R
   ,@parameter_name = N'ConnectionManagerAuditingConnectionString'
   ,@parameter_value = N'ConnectionManagerAuditingConnectionString';

EXEC catalog.set_object_parameter_value
    @folder_name = @FolderName
   ,@project_name = @ProjectName
   ,@object_type = 20
   ,@value_type = R
   ,@parameter_name = N'ConnectionManagerStagingConnectionString'
   ,@parameter_value = N'ConnectionManagerStagingConnectionString';

EXEC catalog.set_object_parameter_value
    @folder_name = @FolderName
   ,@project_name = @ProjectName
   ,@object_type = 20
   ,@value_type = R
   ,@parameter_name = N'ConnectionManagerWWIConnectionString'
   ,@parameter_value = N'ConnectionManagerWWIConnectionString'