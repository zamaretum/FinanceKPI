CREATE TABLE [dbo].["aretum"."bank_reconciliation"] (
    [bank_reconciliation_key] BIGINT          NULL,
    [legal_entity_key]        BIGINT          NULL,
    [bank_account_key]        BIGINT          NULL,
    [statement_date]          DATETIME2 (6)   NULL,
    [beginning_balance]       DECIMAL (20, 4) NULL,
    [ending_balance]          DECIMAL (20, 4) NULL,
    [created_by]              BIGINT          NULL,
    [created_timestamp]       DATETIME2 (6)   NULL,
    [reconciled_by]           BIGINT          NULL,
    [reconciled_timestamp]    DATETIME2 (6)   NULL
);


GO

