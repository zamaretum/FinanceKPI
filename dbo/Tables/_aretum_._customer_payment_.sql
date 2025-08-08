CREATE TABLE [dbo].["aretum"."customer_payment"] (
    [fin_document_key]         BIGINT          NULL,
    [customer_org_key]         BIGINT          NULL,
    [payment_amount]           DECIMAL (20, 4) NULL,
    [payment_method_key]       BIGINT          NULL,
    [bank_account_key]         BIGINT          NULL,
    [account_key]              BIGINT          NULL,
    [organization_key]         BIGINT          NULL,
    [general_ledger_key]       BIGINT          NULL,
    [applied_fin_document_key] BIGINT          NULL,
    [local_payment_amount]     DECIMAL (20, 4) NULL,
    [instance_payment_amount]  DECIMAL (20, 4) NULL
);


GO

