CREATE TABLE [dbo].["aretum"."criteria_set"] (
    [criteria_set_key] BIGINT         NULL,
    [person_key]       BIGINT         NULL,
    [name]             NVARCHAR (50)  NULL,
    [target_path]      NVARCHAR (128) NULL,
    [manager_path]     NVARCHAR (128) NULL,
    [criteria_class]   NVARCHAR (256) NULL,
    [chart]            NVARCHAR (1)   NULL
);


GO

