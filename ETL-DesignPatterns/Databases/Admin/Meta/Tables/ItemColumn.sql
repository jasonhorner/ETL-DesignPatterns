CREATE TABLE [Meta].[ItemColumn] (
    [ItemColumnID]                 INT                                                IDENTITY (1, 1) NOT NULL,
    [ItemColumnName]               VARCHAR (100)                                      NOT NULL,
    [ItemID]                       INT                                                NOT NULL,
    [Ordinal]                      INT                                                NOT NULL,
    [DataType]                     VARCHAR (25)                                       NOT NULL,
    [DataTypeLength]               INT                                                NULL,
    [DataTypePrecision]            INT                                                NULL,
    [DataTypeScale]                INT                                                NULL,
    [ChangeType]                   VARCHAR (10)                                       NULL,
    [IsNullable]                   BIT                                                NULL,
    [IsPrimaryKey]                 BIT                                                NULL,
    [IsIdentity]                   BIT                                                NULL,
    [DerivedColumnReplaceExisting] BIT                                                NULL,
    [DerivedColumnExpression]      VARCHAR (1000)                                     NULL,
    [ItemColumnDescription]        VARCHAR (1000)                                     NULL,
    [ValidFrom]                    DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [ValidTo]                      DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    CONSTRAINT [PK_ItemColumn] PRIMARY KEY CLUSTERED ([ItemColumnID] ASC),
    CONSTRAINT [FK_Item] FOREIGN KEY ([ItemID]) REFERENCES [Meta].[Item] ([ItemID]),
    CONSTRAINT [UQ_ItemColumnOrdinal] UNIQUE NONCLUSTERED ([ItemID] ASC, [Ordinal] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Meta].[ItemColumn_History], DATA_CONSISTENCY_CHECK=ON));

