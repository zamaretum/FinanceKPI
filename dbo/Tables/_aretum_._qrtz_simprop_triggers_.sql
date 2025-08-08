CREATE TABLE [dbo].["aretum"."qrtz_simprop_triggers"] (
    [sched_name]    NVARCHAR (120)  NULL,
    [trigger_name]  NVARCHAR (200)  NULL,
    [trigger_group] NVARCHAR (200)  NULL,
    [str_prop_1]    NVARCHAR (512)  NULL,
    [str_prop_2]    NVARCHAR (512)  NULL,
    [str_prop_3]    NVARCHAR (512)  NULL,
    [int_prop_1]    INT             NULL,
    [int_prop_2]    INT             NULL,
    [long_prop_1]   BIGINT          NULL,
    [long_prop_2]   BIGINT          NULL,
    [dec_prop_1]    DECIMAL (13, 4) NULL,
    [dec_prop_2]    DECIMAL (13, 4) NULL,
    [bool_prop_1]   NVARCHAR (5)    NULL,
    [bool_prop_2]   NVARCHAR (5)    NULL
);


GO

