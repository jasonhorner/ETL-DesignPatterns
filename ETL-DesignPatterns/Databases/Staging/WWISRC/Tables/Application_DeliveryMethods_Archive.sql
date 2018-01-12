CREATE TABLE [WWISRC].[Application_DeliveryMethods_Archive] (
    [DeliveryMethodID]   INT           NOT NULL,
    [DeliveryMethodName] NVARCHAR (50) NOT NULL,
    [LastEditedBy]       INT           NOT NULL,
    [ValidFrom]          DATETIME2 (7) NOT NULL,
    [ValidTo]            DATETIME2 (7) NOT NULL
);

