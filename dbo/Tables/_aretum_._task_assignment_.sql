CREATE TABLE [dbo].["aretum"."task_assignment"] (
    [task_assignment_key]      BIGINT          NULL,
    [project_key]              BIGINT          NULL,
    [person_key]               BIGINT          NULL,
    [task_key]                 BIGINT          NULL,
    [begin_date]               DATETIME2 (6)   NULL,
    [end_date]                 DATETIME2 (6)   NULL,
    [budget_hours]             DECIMAL (15, 2) NULL,
    [etc_hours]                DECIMAL (15, 2) NULL,
    [exceed_budget]            NVARCHAR (1)    NULL,
    [labor_category_key]       BIGINT          NULL,
    [cost_struct_labor_key]    BIGINT          NULL,
    [bill_rate]                DECIMAL (15, 5) NULL,
    [cost_rate]                DECIMAL (15, 5) NULL,
    [bill_rate_source]         NVARCHAR (1)    NULL,
    [cost_rate_source]         NVARCHAR (1)    NULL,
    [bill_customer]            BIGINT          NULL,
    [cost_customer]            BIGINT          NULL,
    [use_wbs_dates]            NVARCHAR (1)    NULL,
    [location_key]             BIGINT          NULL,
    [user01]                   NVARCHAR (128)  NULL,
    [user02]                   NVARCHAR (128)  NULL,
    [user03]                   NVARCHAR (128)  NULL,
    [user04]                   NVARCHAR (128)  NULL,
    [user05]                   NVARCHAR (128)  NULL,
    [est_date_of_completion]   DATETIME2 (6)   NULL,
    [last_etc_update_date]     DATETIME2 (6)   NULL,
    [exceed_hours]             DECIMAL (15, 5) NULL,
    [ic_cost_struct_labor_key] BIGINT          NULL,
    [ic_cost_rate]             DECIMAL (15, 5) NULL,
    [last_updated_timestamp]   DATETIME2 (6)   NULL,
    [bill_rate_currency]       BIGINT          NULL,
    [cost_rate_currency]       BIGINT          NULL
);


GO

