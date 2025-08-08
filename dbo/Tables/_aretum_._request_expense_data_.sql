CREATE TABLE [dbo].["aretum"."request_expense_data"] (
    [request_expense_data_key]   BIGINT          NULL,
    [request_expense_report_key] BIGINT          NULL,
    [expense_type_name]          NVARCHAR (100)  NULL,
    [currency]                   NVARCHAR (100)  NULL,
    [payment_method]             NVARCHAR (100)  NULL,
    [expense_date]               DATETIME2 (6)   NULL,
    [request_allocation_key]     BIGINT          NULL,
    [vendor]                     NVARCHAR (255)  NULL,
    [amount]                     DECIMAL (20, 4) NULL,
    [summary]                    NVARCHAR (2000) NULL,
    [comments]                   NVARCHAR (2000) NULL,
    [account_number]             NVARCHAR (2000) NULL,
    [receipt_included]           NVARCHAR (1)    NULL,
    [no_receipt_reason]          NVARCHAR (128)  NULL,
    [project_type]               NVARCHAR (25)   NULL,
    [billable]                   NVARCHAR (1)    NULL,
    [exchange_rate]              DECIMAL (18, 6) NULL,
    [expense_currency]           NVARCHAR (25)   NULL,
    [expense_amount]             DECIMAL (20, 4) NULL,
    [parent_key]                 BIGINT          NULL,
    [transaction_currency]       BIGINT          NULL
);


GO

