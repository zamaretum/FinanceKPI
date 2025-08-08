CREATE TABLE [dbo].["aretum"."qrtz_fired_triggers"] (
    [sched_name]        NVARCHAR (120) NULL,
    [entry_id]          NVARCHAR (95)  NULL,
    [trigger_name]      NVARCHAR (200) NULL,
    [trigger_group]     NVARCHAR (200) NULL,
    [instance_name]     NVARCHAR (200) NULL,
    [fired_time]        BIGINT         NULL,
    [priority]          INT            NULL,
    [state]             NVARCHAR (16)  NULL,
    [job_name]          NVARCHAR (200) NULL,
    [job_group]         NVARCHAR (200) NULL,
    [is_nonconcurrent]  NVARCHAR (5)   NULL,
    [requests_recovery] NVARCHAR (5)   NULL
);


GO

