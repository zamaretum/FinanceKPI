CREATE TABLE [dbo].["aretum"."invoice_expense_attachment"] (
    [invoice_key]        BIGINT        NULL,
    [expense_data_key]   BIGINT        NULL,
    [attachment_key]     BIGINT        NULL,
    [email_with_invoice] NVARCHAR (1)  NULL,
    [created_by]         BIGINT        NULL,
    [created_timestamp]  DATETIME2 (6) NULL
);


GO

