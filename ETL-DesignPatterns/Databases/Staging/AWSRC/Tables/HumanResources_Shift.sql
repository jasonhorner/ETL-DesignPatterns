CREATE TABLE [AWSRC].[HumanResources_Shift] (
    [ShiftID]      TINYINT       NOT NULL,
    [Name]         NVARCHAR (50) NOT NULL,
    [StartTime]    TIME (7)      NOT NULL,
    [EndTime]      TIME (7)      NOT NULL,
    [ModifiedDate] DATETIME      NOT NULL
);

