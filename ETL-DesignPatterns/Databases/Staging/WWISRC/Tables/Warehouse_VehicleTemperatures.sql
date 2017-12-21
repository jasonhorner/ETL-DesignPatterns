CREATE TABLE [WWISRC].[Warehouse_VehicleTemperatures]
(
-- Columns Definition
	[VehicleTemperatureID] bigint NOT NULL 
,	[VehicleRegistration] nvarchar(20) NOT NULL 
,	[ChillerSensorNumber] int NOT NULL 
,	[RecordedWhen] datetime2(7) NOT NULL 
,	[Temperature] decimal(10,2) NOT NULL 
,	[FullSensorData] nvarchar(1000) 
,	[IsCompressed] bit NOT NULL 
,	[CompressedSensorData] varbinary(max) 

-- Constraints

)
ON "default"
WITH (DATA_COMPRESSION = NONE)