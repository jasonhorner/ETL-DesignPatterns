CREATE TABLE [WWISRC].[Application_PaymentMethods_Archive] (
    [PaymentMethodID]   INT           NOT NULL,
    [PaymentMethodName] NVARCHAR (50) NOT NULL,
    [LastEditedBy]      INT           NOT NULL,
    [ValidFrom]         DATETIME2 (7) NOT NULL,
    [ValidTo]           DATETIME2 (7) NOT NULL
);

