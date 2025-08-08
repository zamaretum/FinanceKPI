CREATE TABLE [dbo].["aretum"."email_template"] (
    [email_template_key]         BIGINT          NULL,
    [name]                       NVARCHAR (50)   NULL,
    [type]                       DECIMAL (3)     NULL,
    [modifiable]                 NVARCHAR (1)    NULL,
    [description]                NVARCHAR (250)  NULL,
    [subject]                    NVARCHAR (250)  NULL,
    [message]                    NVARCHAR (2000) NULL,
    [enabled]                    NVARCHAR (1)    NULL,
    [additional_message_enabled] NVARCHAR (1)    NULL,
    [additional_message]         NVARCHAR (2000) NULL
);


GO

