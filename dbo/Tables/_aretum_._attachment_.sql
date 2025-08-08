CREATE TABLE [dbo].["aretum"."attachment"] (
    [attachment_key]       BIGINT          NULL,
    [attachment_name]      NVARCHAR (255)  NULL,
    [attachment_data]      VARBINARY (MAX) NULL,
    [attachment_mime_type] NVARCHAR (255)  NULL,
    [attachment_length]    BIGINT          NULL
);


GO

