CREATE TABLE [Meta].[Item_History] (
    [ItemID]                            INT            NOT NULL,
    [ItemName]                          VARCHAR (100)  NOT NULL,
    [ItemDescription]                   VARCHAR (1000) NULL,
    [ItemTypeID]                        SMALLINT       NOT NULL,
    [ConnectionID]                      INT            NOT NULL,
    [ProjectID]                         INT            NOT NULL,
    [TableCompressionType]              VARCHAR (5)    NULL,
    [TableLateArriving]                 BIT            NULL,
    [TableExternalPartitionScheme]      VARCHAR (50)   NULL,
    [TablePartitionSchemeName]          VARCHAR (50)   NULL,
    [TablePartitionColumnName]          VARCHAR (50)   NULL,
    [FlatFileExtension]                 VARCHAR (10)   NULL,
    [FlatFileType]                      VARCHAR (15)   NULL,
    [FlatFileIsUnicode]                 BIT            NULL,
    [FlatFileLocale]                    VARCHAR (15)   NULL,
    [FlatFileCodePage]                  INT            NULL,
    [FlatFileTextQualifer]              VARCHAR (15)   NULL,
    [FlatFileHeaderRowDelimiter]        VARCHAR (15)   NULL,
    [FlatFileHeaderRowsToSkip]          INT            NULL,
    [FlatFileColumnNamesInFirstDataRow] BIT            NULL,
    [FlatFileColumnDelimiter]           VARCHAR (15)   NULL,
    [FlatFileRowDelimiter]              VARCHAR (15)   NULL,
    [FlatFileDataRowsToSkip]            INT            NULL,
    [SSISLoadPattern]                   VARCHAR (20)   NULL,
    [SSISParallelDataFlows]             TINYINT        NULL,
    [SSISParallelDataFlowsColumn]       VARCHAR (50)   NULL,
    [ValidFrom]                         DATETIME2 (7)  NOT NULL,
    [ValidTo]                           DATETIME2 (7)  NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_Item_History]
    ON [Meta].[Item_History]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

