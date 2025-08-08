CREATE TABLE [dbo].["aretum"."expense_project_allocation"] (
    [expense_project_allocation_key] BIGINT         NULL,
    [expense_report_key]             BIGINT         NULL,
    [project_key]                    BIGINT         NULL,
    [task_key]                       BIGINT         NULL,
    [allocation]                     DECIMAL (6, 3) NULL,
    [sequence]                       INT            NULL,
    [last_update]                    DATETIME2 (6)  NULL
);


GO

