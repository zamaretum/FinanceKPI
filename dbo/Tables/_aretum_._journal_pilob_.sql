CREATE TABLE [dbo].["aretum"."journal_pilob"] (
    [journal_key]          BIGINT          NULL,
    [journal_trans_date]   DATETIME2 (6)   NULL,
    [time_data_key]        BIGINT          NULL,
    [account_key]          BIGINT          NULL,
    [post_history_key]     BIGINT          NULL,
    [project_key]          BIGINT          NULL,
    [person_key]           BIGINT          NULL,
    [category]             SMALLINT        NULL,
    [amount]               DECIMAL (20, 4) NULL,
    [hours]                DECIMAL (15, 2) NULL,
    [h_w_rate_per_hour]    DECIMAL (15, 5) NULL,
    [emp_rate_per_period]  DECIMAL (15, 5) NULL,
    [pilob_rate]           DECIMAL (15, 5) NULL,
    [extract_date]         DATETIME2 (6)   NULL,
    [organization_key]     BIGINT          NULL,
    [general_ledger_key]   BIGINT          NULL,
    [transaction_currency] BIGINT          NULL,
    [local_currency]       BIGINT          NULL,
    [local_amount]         DECIMAL (20, 4) NULL,
    [instance_amount]      DECIMAL (20, 4) NULL
);


GO

