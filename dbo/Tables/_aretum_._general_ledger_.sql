CREATE TABLE [dbo].["aretum"."general_ledger"] (
    [general_ledger_key]     BIGINT          NULL,
    [feature]                SMALLINT        NULL,
    [post_date]              DATETIME2 (6)   NULL,
    [fiscal_month_key]       BIGINT          NULL,
    [account_key]            BIGINT          NULL,
    [organization_key]       BIGINT          NULL,
    [document_number]        NVARCHAR (50)   NULL,
    [reference]              NVARCHAR (50)   NULL,
    [description]            NVARCHAR (128)  NULL,
    [transaction_date]       DATETIME2 (6)   NULL,
    [quantity]               DECIMAL (18, 3) NULL,
    [debit_amount]           DECIMAL (20, 4) NULL,
    [credit_amount]          DECIMAL (20, 4) NULL,
    [project_key]            BIGINT          NULL,
    [person_key]             BIGINT          NULL,
    [customer_key]           BIGINT          NULL,
    [local_debit_amount]     DECIMAL (20, 4) NULL,
    [local_credit_amount]    DECIMAL (20, 4) NULL,
    [instance_debit_amount]  DECIMAL (20, 4) NULL,
    [instance_credit_amount] DECIMAL (20, 4) NULL,
    [transaction_currency]   BIGINT          NULL,
    [local_currency]         BIGINT          NULL
);


GO

