CREATE TABLE [dbo].["aretum"."task_budget_snapshot"] (
    [task_budget_snapshot_key] BIGINT          NULL,
    [project_key]              BIGINT          NULL,
    [task_key]                 BIGINT          NULL,
    [eff_thru_date]            DATETIME2 (6)   NULL,
    [orig_start_date]          DATETIME2 (6)   NULL,
    [orig_end_date]            DATETIME2 (6)   NULL,
    [rev_start_date]           DATETIME2 (6)   NULL,
    [rev_end_date]             DATETIME2 (6)   NULL,
    [completed_date]           DATETIME2 (6)   NULL,
    [hours_budget]             DECIMAL (15, 2) NULL,
    [hours_etc]                DECIMAL (15, 2) NULL,
    [hours_est_tot]            DECIMAL (15, 2) NULL,
    [exp_bill_budget]          DECIMAL (17, 4) NULL,
    [exp_cost_budget]          DECIMAL (17, 4) NULL,
    [exp_cost_burden_budget]   DECIMAL (17, 4) NULL,
    [exp_bill_etc]             DECIMAL (17, 4) NULL,
    [exp_cost_etc]             DECIMAL (17, 4) NULL,
    [exp_bill_est_tot]         DECIMAL (17, 4) NULL,
    [exp_cost_est_tot]         DECIMAL (17, 4) NULL,
    [labor_bill_budget]        DECIMAL (17, 4) NULL,
    [labor_cost_budget]        DECIMAL (17, 4) NULL,
    [labor_cost_burden_budget] DECIMAL (17, 4) NULL,
    [labor_bill_etc]           DECIMAL (17, 4) NULL,
    [labor_cost_etc]           DECIMAL (17, 4) NULL,
    [labor_bill_est_tot]       DECIMAL (17, 4) NULL,
    [labor_cost_est_tot]       DECIMAL (17, 4) NULL,
    [percent_complete]         DECIMAL (6, 3)  NULL
);


GO

