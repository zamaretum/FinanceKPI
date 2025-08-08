CREATE TABLE [dbo].["aretum"."journal_view"] (
    [journal_type]                VARBINARY (MAX) NULL,
    [project_customer_key]        BIGINT          NULL,
    [project_customer_code]       NVARCHAR (25)   NULL,
    [project_key]                 BIGINT          NULL,
    [project_code]                NVARCHAR (30)   NULL,
    [task_key]                    BIGINT          NULL,
    [task_name]                   NVARCHAR (MAX)  NULL,
    [account_key]                 BIGINT          NULL,
    [account_code]                NVARCHAR (25)   NULL,
    [description]                 NVARCHAR (128)  NULL,
    [type]                        NVARCHAR (1)    NULL,
    [journal_key]                 BIGINT          NULL,
    [journal_trans_date]          DATETIME2 (6)   NULL,
    [transaction_data_key]        BIGINT          NULL,
    [time_data_key]               BIGINT          NULL,
    [expense_data_allocation_key] BIGINT          NULL,
    [post_history_key]            BIGINT          NULL,
    [invoice_key]                 BIGINT          NULL,
    [category]                    SMALLINT        NULL,
    [amount]                      DECIMAL (20, 4) NULL,
    [extract_date]                DATETIME2 (6)   NULL,
    [general_ledger_key]          BIGINT          NULL,
    [organization_key]            BIGINT          NULL,
    [org_code]                    NVARCHAR (25)   NULL,
    [org_name]                    NVARCHAR (128)  NULL,
    [person_key]                  BIGINT          NULL,
    [item_description]            VARBINARY (MAX) NULL,
    [writeoff_amount]             NVARCHAR (MAX)  NULL,
    [writeoff_quantity]           NVARCHAR (MAX)  NULL,
    [writeoff_bill_rate]          NVARCHAR (MAX)  NULL,
    [writeoff_cost]               NVARCHAR (MAX)  NULL,
    [writeoff_markup]             NVARCHAR (MAX)  NULL
);


GO

