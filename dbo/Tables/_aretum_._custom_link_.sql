CREATE TABLE [dbo].["aretum"."custom_link"] (
    [custom_link_key]          BIGINT          NULL,
    [attachment_key]           BIGINT          NULL,
    [link_text]                NVARCHAR (128)  NULL,
    [last_modified_by]         BIGINT          NULL,
    [last_modified_at]         DATETIME2 (6)   NULL,
    [active]                   NVARCHAR (1)    NULL,
    [application_key]          BIGINT          NULL,
    [link_url]                 NVARCHAR (2000) NULL,
    [dashboard_id]             NVARCHAR (128)  NULL,
    [role_expression]          NVARCHAR (4000) NULL,
    [advanced_expression_flag] NVARCHAR (1)    NULL,
    [link_type]                NVARCHAR (1)    NULL,
    [license]                  NVARCHAR (128)  NULL,
    [link_id]                  NVARCHAR (128)  NULL,
    [link_title]               NVARCHAR (128)  NULL,
    [target]                   NVARCHAR (128)  NULL,
    [display_sequence]         BIGINT          NULL
);


GO

