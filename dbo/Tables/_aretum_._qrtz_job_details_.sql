CREATE TABLE [dbo].["aretum"."qrtz_job_details"] (
    [sched_name]        NVARCHAR (120)  NULL,
    [job_name]          NVARCHAR (200)  NULL,
    [job_group]         NVARCHAR (200)  NULL,
    [description]       NVARCHAR (250)  NULL,
    [job_class_name]    NVARCHAR (250)  NULL,
    [is_durable]        NVARCHAR (5)    NULL,
    [is_nonconcurrent]  NVARCHAR (5)    NULL,
    [is_update_data]    NVARCHAR (5)    NULL,
    [requests_recovery] NVARCHAR (5)    NULL,
    [job_data]          VARBINARY (MAX) NULL
);


GO

