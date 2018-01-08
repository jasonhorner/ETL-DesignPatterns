
/* --------------------------------------------------
-- Create Metadata Views
-------------------------------------------------- */
CREATE   VIEW Meta.vConnection
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