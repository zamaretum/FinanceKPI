CREATE TABLE [dbo].["aretum"."pr_expnse_consol_approved_view"] (
    [line_id]                        SMALLINT        NULL,
    [pr_expense_line_descriptor_key] BIGINT          NULL,
    [pr_expense_line_key]            BIGINT          NULL,
    [orig_pr_key]                    BIGINT          NULL,
    [line_pr_key]                    BIGINT          NULL,
    [owning_pr_key]                  BIGINT          NULL,
    [account_key]                    BIGINT          NULL,
    [organization_key]               BIGINT          NULL,
    [reference]                      NVARCHAR (25)   NULL,
    [description]                    NVARCHAR (128)  NULL,
    [project_key]                    BIGINT          NULL,
    [task_key]                       BIGINT          NULL,
    [expense_type_key]               BIGINT          NULL,
    [person_key]                     BIGINT          NULL,
    [begin_date]                     DATETIME2 (6)   NULL,
    [end_date]                       DATETIME2 (6)   NULL,
    [required_by_date]               DATETIME2 (6)   NULL,
    [internal_comments]              NVARCHAR (2000) NULL,
    [external_comments]              NVARCHAR (2000) NULL,
    [amount]                         NVARCHAR (MAX)  NULL
);


GO

