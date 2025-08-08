CREATE TABLE [dbo].["aretum"."person_accrual"] (
    [accrual_plan_key]        BIGINT           NULL,
    [person_accrual_plan_key] BIGINT           NULL,
    [accrual_period_key]      BIGINT           NULL,
    [person_key]              BIGINT           NULL,
    [project_key]             BIGINT           NULL,
    [task_key]                BIGINT           NULL,
    [posted_by_key]           BIGINT           NULL,
    [posted_timestamp]        DATETIME2 (6)    NULL,
    [source_ind]              NVARCHAR (1)     NULL,
    [accrued_hours]           DECIMAL (17, 12) NULL,
    [comments]                NVARCHAR (2000)  NULL
);


GO

