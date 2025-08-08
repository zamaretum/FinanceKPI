CREATE TABLE [dbo].["aretum"."time_period_setup"] (
    [time_period_key]        BIGINT          NULL,
    [period_name]            NVARCHAR (20)   NULL,
    [code]                   NVARCHAR (1)    NULL,
    [begin_date1]            DATETIME2 (6)   NULL,
    [begin_date2]            DATETIME2 (6)   NULL,
    [enabled]                NVARCHAR (1)    NULL,
    [hours_in_period]        DECIMAL (17, 4) NULL,
    [allow_user_adjustments] NVARCHAR (1)    NULL,
    [description]            NVARCHAR (100)  NULL,
    [max_future_period]      BIGINT          NULL,
    [cut_off_date]           DATETIME2 (6)   NULL
);


GO

