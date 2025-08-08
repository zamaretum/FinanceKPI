CREATE TABLE [dbo].["aretum"."po_expense_line_descriptor"] (
    [po_expense_line_descriptor_key] BIGINT         NULL,
    [po_key]                         BIGINT         NULL,
    [pr_expense_line_descriptor_key] BIGINT         NULL,
    [line_id]                        SMALLINT       NULL,
    [account_key]                    BIGINT         NULL,
    [organization_key]               BIGINT         NULL,
    [reference]                      NVARCHAR (25)  NULL,
    [description]                    NVARCHAR (128) NULL,
    [project_key]                    BIGINT         NULL,
    [task_key]                       BIGINT         NULL,
    [expense_type_key]               BIGINT         NULL,
    [person_key]                     BIGINT         NULL,
    [closed_date]                    DATETIME2 (6)  NULL,
    [orig_po_key]                    BIGINT         NULL
);


GO

