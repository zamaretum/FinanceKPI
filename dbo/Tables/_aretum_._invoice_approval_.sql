CREATE TABLE [dbo].["aretum"."invoice_approval"] (
    [invoice_approval_key] BIGINT          NULL,
    [invoice_key]          BIGINT          NULL,
    [performed_by]         BIGINT          NULL,
    [performed_for]        BIGINT          NULL,
    [project_key]          BIGINT          NULL,
    [role_key]             BIGINT          NULL,
    [status]               NVARCHAR (25)   NULL,
    [status_timestamp]     DATETIME2 (6)   NULL,
    [comments]             NVARCHAR (2000) NULL,
    [review_required]      NVARCHAR (1)    NULL,
    [review_timestamp]     DATETIME2 (6)   NULL,
    [review_comments]      NVARCHAR (2000) NULL
);


GO

