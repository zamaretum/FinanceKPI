CREATE TABLE [dbo].["aretum"."person_accrual_plan"] (
    [person_accrual_plan_key] BIGINT        NULL,
    [accrual_plan_key]        BIGINT        NULL,
    [begin_date]              DATETIME2 (6) NULL,
    [end_date]                DATETIME2 (6) NULL,
    [person_key]              BIGINT        NULL,
    [project_key]             BIGINT        NULL,
    [task_key]                BIGINT        NULL,
    [loa_start_date]          DATETIME2 (6) NULL,
    [loa_end_date]            DATETIME2 (6) NULL
);


GO

