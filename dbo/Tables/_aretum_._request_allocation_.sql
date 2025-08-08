CREATE TABLE [dbo].["aretum"."request_allocation"] (
    [request_allocation_key]     BIGINT         NULL,
    [request_expense_report_key] BIGINT         NULL,
    [customer_key]               BIGINT         NULL,
    [project_key]                BIGINT         NULL,
    [task_key]                   BIGINT         NULL,
    [project_name]               NVARCHAR (255) NULL,
    [task_name]                  NVARCHAR (255) NULL,
    [allocation]                 DECIMAL (6, 3) NULL,
    [sequence]                   DECIMAL (3)    NULL
);


GO

