CREATE TABLE [Meta].[ItemColumn_History] (
    [ItemColumnID]                 INT            NOT NULL,
    [ItemColumnName]               VARCHAR (100)  NOT NULL,
    [ItemID]                       INT            NOT NULL,
    [Ordinal]                      INT            NOT NULL,
    [DataType]                     VARCHAR (25)   NOT NULL,
    [DataTypeLength]               INT            NULL,
    [DataTypePrecision]            INT            NULL,
    [DataTypeScale]                INT            NULL,
    [ChangeType]                   VARCHAR (10)   NULL,
    [IsNullable]                   BIT            NULL,
    [IsPrimaryKey]                 BIT            NULL,
    [IsIdentity]                   BIT            NULL,
    [DerivedColumnReplaceExisting] BIT            NULL,
    [DerivedColumnExpression]      VARCHAR (1000) NULL,
    [ItemColumnDescription]        VARCHAR (1000) NULL,
    [ValidFrom]                    DATETIME2 (7)  NOT NULL,
    [ValidTo]                      DATETIME2 (7)  NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_ItemColumn_History]
    ON [Meta].[ItemColumn_History]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

