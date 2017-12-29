CREATE TABLE [AWSRC].[dbo_DatabaseLog] (
    [DatabaseLogID] INT            NOT NULL,
    [PostTime]      DATETIME       NOT NULL,
    [DatabaseUser]  NVARCHAR (128) NOT NULL,
    [Event]         NVARCHAR (128) NOT NULL,
    [Schema]        NVARCHAR (128) NULL,
    [Object]        NVARCHAR (128) NULL,
    [TSQL]          NVARCHAR (MAX) NOT NULL,
    [XmlEvent]      XML            NOT NULL
);

