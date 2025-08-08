CREATE TABLE [dbo].["aretum"."qrtz_triggers"] (
    [sched_name]     NVARCHAR (120)  NULL,
    [trigger_name]   NVARCHAR (200)  NULL,
    [trigger_group]  NVARCHAR (200)  NULL,
    [job_name]       NVARCHAR (200)  NULL,
    [job_group]      NVARCHAR (200)  NULL,
    [description]    NVARCHAR (250)  NULL,
    [next_fire_time] BIGINT          NULL,
    [prev_fire_time] BIGINT          NULL,
    [priority]       INT             NULL,
    [trigger_state]  NVARCHAR (16)   NULL,
    [trigger_type]   NVARCHAR (8)    NULL,
    [start_time]     BIGINT          NULL,
    [end_time]       BIGINT          NULL,
    [calendar_name]  NVARCHAR (200)  NULL,
    [misfire_instr]  SMALLINT        NULL,
    [job_data]       VARBINARY (MAX) NULL
);


GO

