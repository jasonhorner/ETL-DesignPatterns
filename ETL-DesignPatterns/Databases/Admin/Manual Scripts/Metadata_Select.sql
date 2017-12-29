USE Admin;
GO

/* Tables */
SELECT TOP (1000) *  FROM meta.ProjectType;
SELECT TOP (1000) *  FROM Meta.ConnectionType;
SELECT TOP (1000) *  FROM Meta.ConnectionManagerType;

SELECT TOP (1000) *  FROM meta.Project;
SELECT TOP (1000) *  FROM meta.Connection;
--SELECT TOP (1000) *  FROM meta.ProjectConnection;
SELECT TOP (1000) *  FROM meta.Item;
SELECT TOP (1000) *  FROM meta.ItemColumn;

/* Views */
SELECT TOP (1000) *  FROM meta.vProject;
SELECT TOP (1000) *  FROM meta.vConnection;
--SELECT TOP (1000) *  FROM Meta.vProjectConnection;
SELECT TOP (1000) *  FROM meta.vItem;
SELECT TOP (1000) *  FROM meta.vItemColumn;