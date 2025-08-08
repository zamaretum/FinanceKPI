CREATE TABLE [dbo].["aretum"."time_period"] (
    [time_period_key]        BIGINT          NULL,
    [begin_date]             DATETIME2 (6)   NULL,
    [end_date]               DATETIME2 (6)   NULL,
    [hours_in_period]        DECIMAL (17, 4) NULL,
    [allow_user_adjustments] NVARCHAR (1)    NULL,
    [allow_new_timesheets]   NVARCHAR (1)    NULL,
    [prevent_auto_removal]   NVARCHAR (1)    NULL,
    [admin_only_access]      NVARCHAR (1)    NULL
);


GO

