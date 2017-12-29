CREATE TABLE [AWSRC].[Production_ProductReview] (
    [ProductReviewID] INT             NOT NULL,
    [ProductID]       INT             NOT NULL,
    [ReviewerName]    NVARCHAR (50)   NOT NULL,
    [ReviewDate]      DATETIME        NOT NULL,
    [EmailAddress]    NVARCHAR (50)   NOT NULL,
    [Rating]          INT             NOT NULL,
    [Comments]        NVARCHAR (3850) NULL,
    [ModifiedDate]    DATETIME        NOT NULL
);

