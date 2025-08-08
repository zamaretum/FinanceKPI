CREATE TABLE [dbo].["aretum"."plan_set_history"] (
    [plan_set_history_key] BIGINT          NULL,
    [plan_set_key]         BIGINT          NULL,
    [event]                NVARCHAR (1)    NULL,
    [modified_by]          BIGINT          NULL,
    [modified_timestamp]   DATETIME2 (6)   NULL,
    [comments]             NVARCHAR (2000) NULL
);


GO

