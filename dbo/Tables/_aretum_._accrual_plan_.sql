CREATE TABLE [dbo].["aretum"."accrual_plan"] (
    [accrual_plan_key] BIGINT          NULL,
    [accrual_plan]     NVARCHAR (50)   NULL,
    [description]      NVARCHAR (128)  NULL,
    [period_type]      NVARCHAR (1)    NULL,
    [begin_date]       DATETIME2 (6)   NULL,
    [begin_date2]      DATETIME2 (6)   NULL,
    [carryover_ind]    NVARCHAR (1)    NULL,
    [active]           NVARCHAR (1)    NULL,
    [posting_type]     NVARCHAR (1)    NULL,
    [posting_emails]   NVARCHAR (2000) NULL,
    [rate_method]      NVARCHAR (1)    NULL,
    [on_anniversary]   NVARCHAR (1)    NULL
);


GO

