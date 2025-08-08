CREATE TABLE [dbo].["aretum"."expense_pm_approval_status"] (
    [expense_report_key]     BIGINT       NULL,
    [project_key]            BIGINT       NULL,
    [approved]               NVARCHAR (1) NULL,
    [pm_approves_before_mgr] NVARCHAR (1) NULL
);


GO

