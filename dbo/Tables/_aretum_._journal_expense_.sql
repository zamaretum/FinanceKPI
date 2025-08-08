CREATE TABLE [dbo].["aretum"."journal_expense"] (
    [journal_key]                 BIGINT          NULL,
    [journal_trans_date]          DATETIME2 (6)   NULL,
    [expense_data_allocation_key] BIGINT          NULL,
    [organization_key]            BIGINT          NULL,
    [general_ledger_key]          BIGINT          NULL,
    [account_key]                 BIGINT          NULL,
    [post_history_key]            BIGINT          NULL,
    [invoice_key]                 BIGINT          NULL,
    [project_key]                 BIGINT          NULL,
    [category]                    SMALLINT        NULL,
    [amount]                      DECIMAL (20, 4) NULL,
    [extract_date]                DATETIME2 (6)   NULL,
    [transaction_currency]        BIGINT          NULL,
    [local_currency]              BIGINT          NULL,
    [local_amount]                DECIMAL (20, 4) NULL,
    [instance_amount]             DECIMAL (20, 4) NULL
);


GO

