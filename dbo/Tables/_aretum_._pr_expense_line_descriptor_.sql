CREATE TABLE [dbo].["aretum"."pr_expense_line_descriptor"] (
    [pr_expense_line_descriptor_key] BIGINT         NULL,
    [pr_key]                         BIGINT         NULL,
    [line_id]                        SMALLINT       NULL,
    [account_key]                    BIGINT         NULL,
    [organization_key]               BIGINT         NULL,
    [reference]                      NVARCHAR (25)  NULL,
    [description]                    NVARCHAR (128) NULL,
    [project_key]                    BIGINT         NULL,
    [task_key]                       BIGINT         NULL,
    [expense_type_key]               BIGINT         NULL,
    [person_key]                     BIGINT         NULL,
    [orig_pr_key]                    BIGINT         NULL
);


GO

