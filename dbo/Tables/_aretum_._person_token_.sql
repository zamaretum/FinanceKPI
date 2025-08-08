CREATE TABLE [dbo].["aretum"."person_token"] (
    [person_key]            BIGINT          NULL,
    [token_application_key] BIGINT          NULL,
    [token]                 NVARCHAR (4000) NULL,
    [expiration]            DATETIME2 (6)   NULL,
    [created_timestamp]     DATETIME2 (6)   NULL
);


GO

