CREATE TABLE [dbo].["aretum"."accrual_period"] (
    [accrual_period_key] BIGINT        NULL,
    [accrual_plan_key]   BIGINT        NULL,
    [begin_date]         DATETIME2 (6) NULL,
    [end_date]           DATETIME2 (6) NULL,
    [posted_by_key]      BIGINT        NULL,
    [posted_timestamp]   DATETIME2 (6) NULL
);


GO

