CREATE TABLE [dbo].["aretum"."list_criteria_set"] (
    [list_criteria_set_key] BIGINT         NULL,
    [person_key]            BIGINT         NULL,
    [name]                  NVARCHAR (50)  NULL,
    [manager_path]          NVARCHAR (128) NULL,
    [criteria_class]        NVARCHAR (256) NULL
);


GO

