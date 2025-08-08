CREATE TABLE [dbo].["aretum"."password_reset_request"] (
    [person_key] BIGINT        NULL,
    [request_id] NVARCHAR (64) NULL,
    [expires]    DATETIME2 (6) NULL
);


GO

