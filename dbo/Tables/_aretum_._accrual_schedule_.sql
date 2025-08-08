CREATE TABLE [dbo].["aretum"."accrual_schedule"] (
    [accrual_schedule_key] BIGINT           NULL,
    [accrual_plan_key]     BIGINT           NULL,
    [months_of_service]    DECIMAL (4)      NULL,
    [exceed_allowed]       NVARCHAR (1)     NULL,
    [accrual_hours]        DECIMAL (15, 12) NULL,
    [cap_hours]            DECIMAL (15, 5)  NULL,
    [cap_type]             NVARCHAR (1)     NULL,
    [exceed_hours]         DECIMAL (15, 5)  NULL,
    [accrual_cap_type]     NVARCHAR (1)     NULL,
    [accrual_cap_hours]    DECIMAL (15, 5)  NULL
);


GO

