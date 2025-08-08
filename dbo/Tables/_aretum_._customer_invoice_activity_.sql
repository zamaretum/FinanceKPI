CREATE TABLE [dbo].["aretum"."customer_invoice_activity"] (
    [invoice_key]          BIGINT         NULL,
    [post_date]            DATETIME2 (6)  NULL,
    [invoice_amount]       NVARCHAR (MAX) NULL,
    [applied]              NVARCHAR (MAX) NULL,
    [discount]             NVARCHAR (MAX) NULL,
    [writeoff]             NVARCHAR (MAX) NULL,
    [local_invoice_amount] NVARCHAR (MAX) NULL,
    [local_applied]        NVARCHAR (MAX) NULL,
    [local_discount]       NVARCHAR (MAX) NULL,
    [local_writeoff]       NVARCHAR (MAX) NULL
);


GO

