CREATE TABLE [dbo].["aretum"."customer_payment_included_pmt"] (
    [fin_document_key]           BIGINT          NULL,
    [included_fin_document_key]  BIGINT          NULL,
    [applied_general_ledger_key] BIGINT          NULL,
    [applied_amount]             DECIMAL (20, 4) NULL,
    [local_applied_amount]       DECIMAL (20, 4) NULL,
    [instance_applied_amount]    DECIMAL (20, 4) NULL
);


GO

