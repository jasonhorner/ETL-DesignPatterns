
CREATE   VIEW Meta.vItemColumn AS
    SELECT 
	    i.ItemName
	    ,ic.ItemColumnName
	    ,ic.Ordinal
	    ,ic.ChangeType
        ,IIF(ic.IsNullable = 1, 'true', 'false') AS IsNullable
        ,IIF(ic.IsPrimaryKey = 1, 'true', 'false') AS IsPrimaryKey
        ,IIF(ic.IsIdentity = 1, 'true', 'false') AS IsIdentity
	    ,ic.DataType
	    ,ic.DataTypeLength
	    ,ic.DataTypePrecision
	    ,ic.DataTypeScale
        ,IIF(ic.DerivedColumnReplaceExisting = 1, 'true', 'false') AS DerivedColumnReplaceExisting
	    ,ic.DerivedColumnExpression
		,IIF(ic.Ordinal = (SELECT DISTINCT MAX(icm.Ordinal) OVER (PARTITION BY icm.ItemID) FROM Meta.ItemColumn icm WHERE ic.ItemID = icm.ItemID), i.FlatFileRowDelimiter, i.FlatFileColumnDelimiter) AS FlatFileDelimiter
    FROM Meta.ItemColumn ic
    INNER JOIN Meta.Item i ON ic.ItemID = i.ItemID
    INNER JOIN Meta.Project p ON i.ProjectID = p.ProjectID
    ;