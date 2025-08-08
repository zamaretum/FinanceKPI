CREATE TABLE [dbo].["aretum"."fixed_price"] (
    [fixed_price_key]           BIGINT          NULL,
    [project_key]               BIGINT          NULL,
    [task_key]                  BIGINT          NULL,
    [invoice_key]               BIGINT          NULL,
    [post_history_key]          BIGINT          NULL,
    [billable_post_history_key] BIGINT          NULL,
    [bill_date]                 DATETIME2 (6)   NULL,
    [use_wbs_end_date]          NVARCHAR (1)    NULL,
    [description]               NVARCHAR (128)  NULL,
    [amount]                    DECIMAL (20, 4) NULL,
    [rev_rec_method]            DECIMAL (1)     NULL,
    [local_amount]              DECIMAL (20, 4) NULL,
    [local_exchange_rate]       DECIMAL (18, 6) NULL,
    [instance_amount]           DECIMAL (20, 4) NULL,
    [instance_exchange_rate]    DECIMAL (18, 6) NULL
);


GO

