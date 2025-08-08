CREATE TABLE [dbo].["aretum"."person_device_token"] (
    [person_device_token_key] BIGINT          NULL,
    [person_key]              BIGINT          NULL,
    [device_token]            NVARCHAR (4000) NULL,
    [created_date]            DATETIME2 (6)   NULL
);


GO

