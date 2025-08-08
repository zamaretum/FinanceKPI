CREATE TABLE [dbo].["aretum"."project_note_comment"] (
    [project_note_comment_key] BIGINT          NULL,
    [project_note_key]         BIGINT          NULL,
    [commentor]                BIGINT          NULL,
    [create_date]              DATETIME2 (6)   NULL,
    [modified_date]            DATETIME2 (6)   NULL,
    [modifier]                 BIGINT          NULL,
    [comments]                 NVARCHAR (2000) NULL
);


GO

