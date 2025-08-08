CREATE TABLE [dbo].["aretum"."project_cost_summary_a"] (
    [project_key]             BIGINT          NULL,
    [task_key]                BIGINT          NULL,
    [cost_report_element_key] BIGINT          NULL,
    [period_begin_date]       DATETIME2 (6)   NULL,
    [period_end_date]         DATETIME2 (6)   NULL,
    [row_metric_type]         NVARCHAR (128)  NULL,
    [period_type]             NVARCHAR (32)   NULL,
    [project_lead_key]        BIGINT          NULL,
    [project_mgr_key]         BIGINT          NULL,
    [project_viewer_key]      BIGINT          NULL,
    [amount_or_hours]         DECIMAL (15, 2) NULL,
    [eac_amount]              DECIMAL (15, 2) NULL,
    [fiscal_ytd_amount]       DECIMAL (15, 2) NULL,
    [itd_amount]              DECIMAL (15, 2) NULL,
    [last_update_time]        DATETIME2 (6)   NULL
);


GO

