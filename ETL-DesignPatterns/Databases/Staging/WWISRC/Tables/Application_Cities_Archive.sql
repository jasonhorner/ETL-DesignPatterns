CREATE TABLE [WWISRC].[Application_Cities_Archive] (
    [CityID]                   INT               NOT NULL,
    [CityName]                 NVARCHAR (50)     NOT NULL,
    [StateProvinceID]          INT               NOT NULL,
    [Location]                 [sys].[geography] NULL,
    [LatestRecordedPopulation] BIGINT            NULL,
    [LastEditedBy]             INT               NOT NULL,
    [ValidFrom]                DATETIME2 (7)     NOT NULL,
    [ValidTo]                  DATETIME2 (7)     NOT NULL
);

