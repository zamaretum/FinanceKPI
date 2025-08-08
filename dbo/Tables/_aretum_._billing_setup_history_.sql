CREATE TABLE [dbo].["aretum"."billing_setup_history"] (
    [time_date_type]            NVARCHAR (1)  NULL,
    [expense_date_type]         NVARCHAR (1)  NULL,
    [bill_pool_rate_type]       NVARCHAR (1)  NULL,
    [recog_pool_rate_type]      NVARCHAR (1)  NULL,
    [bill_burden_rate_type]     NVARCHAR (1)  NULL,
    [ic_labor_post_type]        NVARCHAR (1)  NULL,
    [ic_expense_post_type]      NVARCHAR (1)  NULL,
    [ic_labor_pool_rate_type]   NVARCHAR (1)  NULL,
    [ic_expense_pool_rate_type] NVARCHAR (1)  NULL,
    [modified_by]               BIGINT        NULL,
    [modified_date]             DATETIME2 (6) NULL,
    [billing_setup_history_key] BIGINT        NULL
);


GO

