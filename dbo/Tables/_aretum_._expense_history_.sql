CREATE TABLE [dbo].["aretum"."expense_history"] (
    [expense_history_key] BIGINT          NULL,
    [expense_report_key]  BIGINT          NULL,
    [status]              NVARCHAR (25)   NULL,
    [controller]          BIGINT          NULL,
    [change_date]         DATETIME2 (6)   NULL,
    [comments]            NVARCHAR (2000) NULL,
    [performed_by]        BIGINT          NULL,
    [project_key]         BIGINT          NULL,
    [role_key]            BIGINT          NULL,
    [performed_for]       BIGINT          NULL,
    [review_required]     NVARCHAR (1)    NULL,
    [review_date]         DATETIME2 (6)   NULL,
    [review_comments]     NVARCHAR (2000) NULL
);


GO

