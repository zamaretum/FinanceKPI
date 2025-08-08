CREATE TABLE [dbo].["aretum"."image_setup"] (
    [image_setup_key]  BIGINT         NULL,
    [name]             NVARCHAR (50)  NULL,
    [type]             DECIMAL (1)    NULL,
    [description]      NVARCHAR (100) NULL,
    [attachment_key]   BIGINT         NULL,
    [url]              NVARCHAR (128) NULL,
    [alt_text]         NVARCHAR (128) NULL,
    [last_modified_by] BIGINT         NULL,
    [last_modified_at] DATETIME2 (6)  NULL,
    [active]           NVARCHAR (1)   NULL
);


GO

