CREATE TABLE [dbo].["aretum"."plan_set"] (
    [plan_set_key]      BIGINT          NULL,
    [plan_set_name_key] BIGINT          NULL,
    [project_key]       BIGINT          NULL,
    [version]           DECIMAL (3)     NULL,
    [description]       NVARCHAR (2000) NULL,
    [active]            NVARCHAR (1)    NULL,
    [locked]            NVARCHAR (1)    NULL
);


GO

