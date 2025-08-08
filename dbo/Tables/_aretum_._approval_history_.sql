CREATE TABLE [dbo].["aretum"."approval_history"] (
    [approval_history_key] BIGINT          NULL,
    [person_time_key]      BIGINT          NULL,
    [person_key]           BIGINT          NULL,
    [alternate_for_key]    BIGINT          NULL,
    [action_date]          DATETIME2 (6)   NULL,
    [project_key]          BIGINT          NULL,
    [comments]             NVARCHAR (2000) NULL,
    [status]               NVARCHAR (25)   NULL,
    [adjustment_status]    NVARCHAR (25)   NULL,
    [pending_adjustment]   NVARCHAR (1)    NULL,
    [role_key]             BIGINT          NULL,
    [review_required]      NVARCHAR (1)    NULL,
    [review_date]          DATETIME2 (6)   NULL,
    [review_comments]      NVARCHAR (2000) NULL
);


GO

