CREATE TABLE [dbo].["aretum"."person_time_day"] (
    [time_day_key]        BIGINT          NULL,
    [person_time_key]     BIGINT          NULL,
    [work_date]           DATETIME2 (6)   NULL,
    [adjusted_number]     BIGINT          NULL,
    [modified_person_key] BIGINT          NULL,
    [post_date]           DATETIME2 (6)   NULL,
    [last_update]         DATETIME2 (6)   NULL,
    [pending_adjustment]  NVARCHAR (1)    NULL,
    [adjusted_head]       NVARCHAR (1)    NULL,
    [pending_head]        NVARCHAR (1)    NULL,
    [adjustment_reason]   NVARCHAR (2000) NULL
);


GO

