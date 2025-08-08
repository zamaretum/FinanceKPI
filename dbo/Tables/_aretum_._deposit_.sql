CREATE TABLE [dbo].["aretum"."deposit"] (
    [fin_document_key]        BIGINT          NULL,
    [bank_account_key]        BIGINT          NULL,
    [account_key]             BIGINT          NULL,
    [organization_key]        BIGINT          NULL,
    [general_ledger_key]      BIGINT          NULL,
    [deposit_amount]          DECIMAL (20, 4) NULL,
    [local_deposit_amount]    DECIMAL (20, 4) NULL,
    [instance_deposit_amount] DECIMAL (20, 4) NULL
);


GO

