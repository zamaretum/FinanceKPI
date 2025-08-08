CREATE TABLE [dbo].["aretum"."po_expense_assignment"] (
    [po_expense_assignment_key]      BIGINT        NULL,
    [po_key]                         BIGINT        NULL,
    [po_expense_line_descriptor_key] BIGINT        NULL,
    [person_key]                     BIGINT        NULL,
    [project_key]                    BIGINT        NULL,
    [task_key]                       BIGINT        NULL,
    [expense_type_key]               BIGINT        NULL,
    [begin_date]                     DATETIME2 (6) NULL,
    [end_date]                       DATETIME2 (6) NULL
);


GO

