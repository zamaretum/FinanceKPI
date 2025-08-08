CREATE TABLE [dbo].["aretum"."pg_stat_statements"] (
    [userid]              BIGINT          NULL,
    [dbid]                BIGINT          NULL,
    [toplevel]            NVARCHAR (5)    NULL,
    [queryid]             BIGINT          NULL,
    [query]               VARBINARY (MAX) NULL,
    [plans]               BIGINT          NULL,
    [total_plan_time]     FLOAT (53)      NULL,
    [min_plan_time]       FLOAT (53)      NULL,
    [max_plan_time]       FLOAT (53)      NULL,
    [mean_plan_time]      FLOAT (53)      NULL,
    [stddev_plan_time]    FLOAT (53)      NULL,
    [calls]               BIGINT          NULL,
    [total_exec_time]     FLOAT (53)      NULL,
    [min_exec_time]       FLOAT (53)      NULL,
    [max_exec_time]       FLOAT (53)      NULL,
    [mean_exec_time]      FLOAT (53)      NULL,
    [stddev_exec_time]    FLOAT (53)      NULL,
    [rows]                BIGINT          NULL,
    [shared_blks_hit]     BIGINT          NULL,
    [shared_blks_read]    BIGINT          NULL,
    [shared_blks_dirtied] BIGINT          NULL,
    [shared_blks_written] BIGINT          NULL,
    [local_blks_hit]      BIGINT          NULL,
    [local_blks_read]     BIGINT          NULL,
    [local_blks_dirtied]  BIGINT          NULL,
    [local_blks_written]  BIGINT          NULL,
    [temp_blks_read]      BIGINT          NULL,
    [temp_blks_written]   BIGINT          NULL,
    [blk_read_time]       FLOAT (53)      NULL,
    [blk_write_time]      FLOAT (53)      NULL,
    [wal_records]         BIGINT          NULL,
    [wal_fpi]             BIGINT          NULL,
    [wal_bytes]           NVARCHAR (MAX)  NULL
);


GO

