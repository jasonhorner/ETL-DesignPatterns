
CREATE   VIEW Meta.vItem AS
    SELECT 
	    i.ItemName
	    ,it.ItemType
		,c.ConnectionName
	    ,p.ProjectName
	    ,i.FlatFileExtension
	    ,i.FlatFileType
        ,IIF(i.FlatFileIsUnicode = 1, 'true', 'false') AS FlatFileIsUnicode
        ,IIF(i.FlatFileColumnNamesInFirstDataRow = 1, 'true', 'false') AS FlatFileColumnNamesInFirstDataRow
		,i.FlatFileColumnDelimiter
	    ,i.FlatFileRowDelimiter
	    ,i.SSISLoadPattern
	    ,i.SSISParallelDataFlows
	    ,i.SSISParallelDataFlowsColumn
    FROM Meta.Item AS i
	INNER JOIN Meta.ItemType AS it ON i.ItemTypeID = it.ItemTypeID
	INNER JOIN Meta.Connection AS c ON i.ConnectionID = c.ConnectionID
    INNER JOIN Meta.Project p ON i.ProjectID = p.ProjectID
    ;