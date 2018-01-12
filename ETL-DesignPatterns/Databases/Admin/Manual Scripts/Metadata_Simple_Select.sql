USE Admin;
GO

/* Tables */
SELECT TOP (1000) *  FROM Meta.ConnectionManagerType;
SELECT TOP (1000) *  FROM Meta.Connection;
SELECT TOP (1000) *  FROM Meta.ProjectType;
SELECT TOP (1000) *  FROM Meta.Project;
SELECT TOP (1000) *  FROM Meta.ItemType;
SELECT TOP (1000) *  FROM Meta.Item;
SELECT TOP (1000) *  FROM Meta.ItemColumn;

/* Views */
SELECT TOP (1000) *  FROM Meta.vConnection;
SELECT TOP (1000) *  FROM Meta.vProject;
SELECT TOP (1000) *  FROM meta.vItem;
SELECT TOP (1000) *  FROM meta.vItemColumn;