CREATE TABLE [dbo].["aretum"."general_alert_prefs"] (
    [person_key]                 BIGINT       NULL,
    [show_to_pm]                 NVARCHAR (1) NULL,
    [show_to_pm_alt]             NVARCHAR (1) NULL,
    [show_to_lead]               NVARCHAR (1) NULL,
    [show_to_lead_alt]           NVARCHAR (1) NULL,
    [show_to_approver]           NVARCHAR (1) NULL,
    [show_to_approver_alt]       NVARCHAR (1) NULL,
    [email_alert]                NVARCHAR (1) NULL,
    [time_elapsed_alert]         NVARCHAR (1) NULL,
    [hours_alert]                NVARCHAR (1) NULL,
    [total_cost_alert]           NVARCHAR (1) NULL,
    [labor_cost_alert]           NVARCHAR (1) NULL,
    [expense_cost_alert]         NVARCHAR (1) NULL,
    [total_bill_alert]           NVARCHAR (1) NULL,
    [time_elapsed_alert_pct]     DECIMAL (3)  NULL,
    [hours_alert_pct]            DECIMAL (3)  NULL,
    [total_cost_alert_pct]       DECIMAL (3)  NULL,
    [labor_cost_alert_pct]       DECIMAL (3)  NULL,
    [expense_cost_alert_pct]     DECIMAL (3)  NULL,
    [total_bill_alert_pct]       DECIMAL (3)  NULL,
    [hours_alert_denom]          NVARCHAR (1) NULL,
    [total_cost_alert_denom]     NVARCHAR (1) NULL,
    [labor_cost_alert_denom]     NVARCHAR (1) NULL,
    [expense_cost_alert_denom]   NVARCHAR (1) NULL,
    [total_bill_alert_denom]     NVARCHAR (1) NULL,
    [funding_expended_alert]     NVARCHAR (1) NULL,
    [funding_expended_alert_pct] DECIMAL (3)  NULL
);


GO

