CREATE TABLE [dbo].["aretum"."fp_revenue_percent_complete"] (
    [fp_revenue_percent_complete_key] BIGINT          NULL,
    [fixed_price_key]                 BIGINT          NULL,
    [post_history_key]                BIGINT          NULL,
    [percent_complete]                DECIMAL (18, 6) NULL,
    [amount]                          DECIMAL (20, 4) NULL,
    [local_amount]                    DECIMAL (20, 4) NULL,
    [local_exchange_rate]             DECIMAL (18, 6) NULL,
    [instance_amount]                 DECIMAL (20, 4) NULL,
    [instance_exchange_rate]          DECIMAL (18, 6) NULL
);


GO

