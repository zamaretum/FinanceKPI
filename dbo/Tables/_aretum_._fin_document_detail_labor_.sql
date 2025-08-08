CREATE TABLE [dbo].["aretum"."fin_document_detail_labor"] (
    [fin_document_detail_key]      BIGINT          NULL,
    [amount]                       DECIMAL (20, 4) NULL,
    [bill_amount]                  DECIMAL (20, 4) NULL,
    [bill_rate]                    DECIMAL (15, 5) NULL,
    [cost_struct_labor_key]        BIGINT          NULL,
    [post_history_key]             BIGINT          NULL,
    [invoice_key]                  BIGINT          NULL,
    [gl_customer_key]              BIGINT          NULL,
    [manual_invoice_key]           BIGINT          NULL,
    [bill_currency]                BIGINT          NULL,
    [local_amount]                 DECIMAL (20, 4) NULL,
    [local_bill_exchange_rate]     DECIMAL (18, 6) NULL,
    [local_bill_amount]            DECIMAL (20, 4) NULL,
    [instance_bill_exchange_rate]  DECIMAL (18, 6) NULL,
    [instance_amount]              DECIMAL (20, 4) NULL,
    [instance_bill_amount]         DECIMAL (20, 4) NULL,
    [source_bill_rate_currency]    BIGINT          NULL,
    [proj_bill_exchange_rate]      DECIMAL (18, 6) NULL,
    [source_bill_rate]             DECIMAL (15, 5) NULL,
    [bill_local_exchange_rate]     DECIMAL (18, 6) NULL,
    [instance_local_exchange_rate] DECIMAL (18, 6) NULL
);


GO

