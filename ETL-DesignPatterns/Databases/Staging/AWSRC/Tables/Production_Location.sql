CREATE TABLE [AWSRC].[Production_Location] (
    [LocationID]   SMALLINT       NOT NULL,
    [Name]         NVARCHAR (50)  NOT NULL,
    [CostRate]     SMALLMONEY     NOT NULL,
    [Availability] DECIMAL (8, 2) NOT NULL,
    [ModifiedDate] DATETIME       NOT NULL
);

