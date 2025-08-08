CREATE TABLE [dbo].["aretum"."invoice_email"] (
    [invoice_email_key]   BIGINT         NULL,
    [invoice_key]         BIGINT         NULL,
    [email_address]       NVARCHAR (255) NULL,
    [email_id]            NVARCHAR (64)  NULL,
    [email_template_type] DECIMAL (3)    NULL
);


GO

