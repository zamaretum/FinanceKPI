CREATE TABLE [dbo].["aretum"."task_alert"] (
    [alert_key]   BIGINT        NULL,
    [project_key] BIGINT        NULL,
    [task_key]    BIGINT        NULL,
    [alert_type]  DECIMAL (2)   NULL,
    [threshold]   DECIMAL (3)   NULL,
    [created]     DATETIME2 (6) NULL
);


GO

