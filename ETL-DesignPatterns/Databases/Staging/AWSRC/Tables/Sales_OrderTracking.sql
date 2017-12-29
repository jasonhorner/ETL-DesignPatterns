CREATE TABLE [AWSRC].[Sales_OrderTracking] (
    [OrderTrackingID]       INT             NOT NULL,
    [SalesOrderID]          INT             NOT NULL,
    [CarrierTrackingNumber] NVARCHAR (25)   NULL,
    [TrackingEventID]       INT             NOT NULL,
    [EventDetails]          NVARCHAR (2000) NOT NULL,
    [EventDateTime]         DATETIME2 (7)   NOT NULL
);

