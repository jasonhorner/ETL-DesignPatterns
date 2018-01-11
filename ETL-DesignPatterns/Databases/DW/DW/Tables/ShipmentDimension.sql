CREATE TABLE [DW].[ShipmentDimension] (
    [ShipmentDimensionSk]  INT           IDENTITY (1, 1) NOT NULL,
    [HashKey]              NCHAR (20)   NULL,
    [StatusCode]           CHAR (3)     NULL,
    [StatusName]           VARCHAR (50) NULL,
    [PriorityCode]         CHAR (1)     NULL,
    [PriorityName]         VARCHAR (50) NULL,
    [TypeCode]             CHAR (3)     NULL,
    [TypeDescription]      VARCHAR (50) NULL,
    [ContainerCode]        CHAR (3)     NULL,
    [ContainerDescription] VARCHAR (50) NULL,
    CONSTRAINT [DW_ShipmentDimension_PK] PRIMARY KEY CLUSTERED ([ShipmentDimensionSk] ASC)
);

