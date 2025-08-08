CREATE TABLE [dbo].["aretum"."fp_revenue_schedule"] (
    [fp_revenue_schedule_key] BIGINT          NULL,
    [fixed_price_key]         BIGINT          NULL,
    [post_history_key]        BIGINT          NULL,
    [rev_date]                DATETIME2 (6)   NULL,
    [amount]                  DECIMAL (20, 4) NULL,
    [local_amount]            DECIMAL (20, 4) NULL,
    [local_exchange_rate]     DECIMAL (18, 6) NULL,
    [instance_amount]         DECIMAL (20, 4) NULL,
    [instance_exchange_rate]  DECIMAL (18, 6) NULL
);


GO

