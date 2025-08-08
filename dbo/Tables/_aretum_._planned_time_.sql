CREATE TABLE [dbo].["aretum"."planned_time"] (
    [planned_time_key]         BIGINT          NULL,
    [person_key]               BIGINT          NULL,
    [project_key]              BIGINT          NULL,
    [task_key]                 BIGINT          NULL,
    [labor_category_key]       BIGINT          NULL,
    [cost_struct_labor_key]    BIGINT          NULL,
    [begin_date]               DATETIME2 (6)   NULL,
    [end_date]                 DATETIME2 (6)   NULL,
    [planned_hours]            DECIMAL (15, 2) NULL,
    [bill_rate]                DECIMAL (15, 5) NULL,
    [cost_rate]                DECIMAL (15, 5) NULL,
    [bill_rate_source]         NVARCHAR (1)    NULL,
    [cost_rate_source]         NVARCHAR (1)    NULL,
    [block_out]                NVARCHAR (1)    NULL,
    [use_wbs_dates]            NVARCHAR (1)    NULL,
    [location_key]             BIGINT          NULL,
    [resource_request_key]     BIGINT          NULL,
    [plan_set_key]             BIGINT          NULL,
    [ic_cost_struct_labor_key] BIGINT          NULL,
    [ic_cost_rate]             DECIMAL (15, 5) NULL,
    [bill_rate_currency]       BIGINT          NULL,
    [cost_rate_currency]       BIGINT          NULL
);


GO

