CREATE TABLE [WWISRC].[Warehouse_ColdRoomTemperatures]
(
-- Columns Definition
	[ColdRoomTemperatureID] bigint NOT NULL 
,	[ColdRoomSensorNumber] int NOT NULL 
,	[RecordedWhen] datetime2(7) NOT NULL 
,	[Temperature] decimal(10,2) NOT NULL 
,	[ValidFrom] datetime2(7) NOT NULL 
,	[ValidTo] datetime2(7) NOT NULL 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)