CREATE TABLE [dbo].["aretum"."customer_payment_included_inv"] (
    [fin_document_key]               BIGINT          NULL,
    [invoice_key]                    BIGINT          NULL,
    [applied_general_ledger_key]     BIGINT          NULL,
    [discount_general_ledger_key]    BIGINT          NULL,
    [writeoff_general_ledger_key]    BIGINT          NULL,
    [applied_amount]                 DECIMAL (20, 4) NULL,
    [discount_amount]                DECIMAL (20, 4) NULL,
    [writeoff_amount]                DECIMAL (20, 4) NULL,
    [local_applied_amount]           DECIMAL (20, 4) NULL,
    [local_discount_amount]          DECIMAL (20, 4) NULL,
    [local_writeoff_amount]          DECIMAL (20, 4) NULL,
    [instance_applied_amount]        DECIMAL (20, 4) NULL,
    [instance_discount_amount]       DECIMAL (20, 4) NULL,
    [instance_writeoff_amount]       DECIMAL (20, 4) NULL,
    [local_fx_gain]                  DECIMAL (20, 4) NULL,
    [local_fx_loss]                  DECIMAL (20, 4) NULL,
    [local_fx_general_ledger_key]    BIGINT          NULL,
    [instance_fx_gain]               DECIMAL (20, 4) NULL,
    [instance_fx_loss]               DECIMAL (20, 4) NULL,
    [instance_fx_general_ledger_key] BIGINT          NULL
);


GO

