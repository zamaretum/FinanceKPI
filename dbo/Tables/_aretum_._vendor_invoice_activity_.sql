CREATE TABLE [dbo].["aretum"."vendor_invoice_activity"] (
    [fin_document_key]        BIGINT         NULL,
    [post_date]               DATETIME2 (6)  NULL,
    [invoice_amount]          NVARCHAR (MAX) NULL,
    [applied]                 NVARCHAR (MAX) NULL,
    [discount]                NVARCHAR (MAX) NULL,
    [currency]                BIGINT         NULL,
    [local_currency]          BIGINT         NULL,
    [local_invoice_amount]    NVARCHAR (MAX) NULL,
    [local_applied]           NVARCHAR (MAX) NULL,
    [local_discount]          NVARCHAR (MAX) NULL,
    [instance_invoice_amount] NVARCHAR (MAX) NULL,
    [instance_applied]        NVARCHAR (MAX) NULL,
    [instance_discount]       NVARCHAR (MAX) NULL
);


GO

