
CREATE   VIEW Meta.vProject
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