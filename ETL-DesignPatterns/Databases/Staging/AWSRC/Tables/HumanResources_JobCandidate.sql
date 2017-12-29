CREATE TABLE [AWSRC].[HumanResources_JobCandidate] (
    [JobCandidateID]   INT      NOT NULL,
    [BusinessEntityID] INT      NULL,
    [Resume]           XML      NULL,
    [ModifiedDate]     DATETIME NOT NULL
);

