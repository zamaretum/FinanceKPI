CREATE TABLE [dbo].["aretum"."vendor_payment_activity"] (
    [fin_document_key]               BIGINT          NULL,
    [post_date]                      DATETIME2 (6)   NULL,
    [payment_amount]                 NVARCHAR (MAX)  NULL,
    [balance]                        NVARCHAR (MAX)  NULL,
    [applied]                        NVARCHAR (MAX)  NULL,
    [discount]                       NVARCHAR (MAX)  NULL,
    [currency]                       BIGINT          NULL,
    [local_currency]                 BIGINT          NULL,
    [is_posted]                      VARBINARY (MAX) NULL,
    [posted_local_payment_amount]    NVARCHAR (MAX)  NULL,
    [posted_local_balance]           NVARCHAR (MAX)  NULL,
    [posted_local_applied]           NVARCHAR (MAX)  NULL,
    [posted_local_discount]          NVARCHAR (MAX)  NULL,
    [posted_instance_payment_amount] NVARCHAR (MAX)  NULL,
    [posted_instance_balance]        NVARCHAR (MAX)  NULL,
    [posted_instance_applied]        NVARCHAR (MAX)  NULL,
    [posted_instance_discount]       NVARCHAR (MAX)  NULL
);


GO

