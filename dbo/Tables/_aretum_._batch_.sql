CREATE TABLE [dbo].["aretum"."batch"] (
    [batch_key]       BIGINT         NULL,
    [batch_number]    BIGINT         NULL,
    [batch_timestamp] DATETIME2 (6)  NULL,
    [person_key]      BIGINT         NULL,
    [description]     NVARCHAR (128) NULL
);


GO

