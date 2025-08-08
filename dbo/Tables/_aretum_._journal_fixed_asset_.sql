CREATE TABLE [dbo].["aretum"."journal_fixed_asset"] (
    [journal_key]            BIGINT          NULL,
    [post_date]              DATETIME2 (6)   NULL,
    [transaction_date]       DATETIME2 (6)   NULL,
    [extract_date]           DATETIME2 (6)   NULL,
    [fixed_asset_key]        BIGINT          NULL,
    [organization_key]       BIGINT          NULL,
    [general_ledger_key]     BIGINT          NULL,
    [post_history_key]       BIGINT          NULL,
    [account_key]            BIGINT          NULL,
    [category]               SMALLINT        NULL,
    [amount]                 DECIMAL (20, 4) NULL,
    [currency]               BIGINT          NULL,
    [local_currency]         BIGINT          NULL,
    [local_amount]           DECIMAL (20, 4) NULL,
    [local_exchange_rate]    DECIMAL (18, 6) NULL,
    [instance_amount]        DECIMAL (20, 4) NULL,
    [instance_exchange_rate] DECIMAL (18, 6) NULL
);


GO

