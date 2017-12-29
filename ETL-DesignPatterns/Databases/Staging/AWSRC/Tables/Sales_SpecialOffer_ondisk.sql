CREATE TABLE [AWSRC].[Sales_SpecialOffer_ondisk] (
    [SpecialOfferID] INT            NOT NULL,
    [Description]    NVARCHAR (255) NOT NULL,
    [DiscountPct]    SMALLMONEY     NOT NULL,
    [Type]           NVARCHAR (50)  NOT NULL,
    [Category]       NVARCHAR (50)  NOT NULL,
    [StartDate]      DATETIME2 (7)  NOT NULL,
    [EndDate]        DATETIME2 (7)  NOT NULL,
    [MinQty]         INT            NOT NULL,
    [MaxQty]         INT            NULL,
    [ModifiedDate]   DATETIME2 (7)  NOT NULL
);

