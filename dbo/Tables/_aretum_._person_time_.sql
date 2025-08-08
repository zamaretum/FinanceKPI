CREATE TABLE [dbo].["aretum"."person_time"] (
    [person_time_key]           BIGINT           NULL,
    [time_period_key]           BIGINT           NULL,
    [begin_date]                DATETIME2 (6)    NULL,
    [person_key]                BIGINT           NULL,
    [control_key]               BIGINT           NULL,
    [date_completed]            DATETIME2 (6)    NULL,
    [status]                    NVARCHAR (25)    NULL,
    [adjustment_status]         NVARCHAR (25)    NULL,
    [adjustment_date]           DATETIME2 (6)    NULL,
    [dilution_factor]           DECIMAL (15, 12) NULL,
    [dilution_hours]            DECIMAL (17, 4)  NULL,
    [dilution_bus_hours]        DECIMAL (17, 4)  NULL,
    [dilution_bus_hours_factor] DECIMAL (15, 12) NULL,
    [dilution_calc_req]         NVARCHAR (1)     NULL,
    [comments]                  NVARCHAR (2000)  NULL,
    [historical]                NVARCHAR (1)     NULL,
    [punch_clock_timesheet]     NVARCHAR (1)     NULL,
    [last_updated_timestamp]    DATETIME2 (6)    NULL,
    [last_drawer_state]         NVARCHAR (1)     NULL
);


GO

