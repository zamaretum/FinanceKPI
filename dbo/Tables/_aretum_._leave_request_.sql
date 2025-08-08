CREATE TABLE [dbo].["aretum"."leave_request"] (
    [leave_request_key] BIGINT          NULL,
    [person_key]        BIGINT          NULL,
    [begin_date]        DATETIME2 (6)   NULL,
    [end_date]          DATETIME2 (6)   NULL,
    [hours]             DECIMAL (15, 2) NULL,
    [non_work_days_ind] NVARCHAR (1)    NULL,
    [controller]        BIGINT          NULL,
    [status]            NVARCHAR (25)   NULL,
    [status_timestamp]  DATETIME2 (6)   NULL,
    [comments]          NVARCHAR (2000) NULL
);


GO

