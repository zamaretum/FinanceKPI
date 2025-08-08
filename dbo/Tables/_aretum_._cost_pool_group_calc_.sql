CREATE TABLE [dbo].["aretum"."cost_pool_group_calc"] (
    [cost_pool_group_calc_key] BIGINT        NULL,
    [cost_pool_group_key]      BIGINT        NULL,
    [post_fiscal_month_key]    BIGINT        NULL,
    [rev_fiscal_month_key]     BIGINT        NULL,
    [calculated_by]            BIGINT        NULL,
    [calculated_timestamp]     DATETIME2 (6) NULL,
    [posted_by]                BIGINT        NULL,
    [posted_timestamp]         DATETIME2 (6) NULL,
    [voided_by]                BIGINT        NULL,
    [voided_timestamp]         DATETIME2 (6) NULL
);


GO

