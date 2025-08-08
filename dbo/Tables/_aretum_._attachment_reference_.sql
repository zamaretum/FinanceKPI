CREATE TABLE [dbo].["aretum"."attachment_reference"] (
    [attachment_reference_key] BIGINT         NULL,
    [attachment_key]           BIGINT         NULL,
    [shared_document_key]      BIGINT         NULL,
    [attached_timestamp]       DATETIME2 (6)  NULL,
    [attached_by]              BIGINT         NULL,
    [description]              NVARCHAR (128) NULL
);


GO

