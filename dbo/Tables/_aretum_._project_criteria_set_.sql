CREATE TABLE [dbo].["aretum"."project_criteria_set"] (
    [project_criteria_set_key] BIGINT         NULL,
    [project_key]              BIGINT         NULL,
    [person_key]               BIGINT         NULL,
    [name]                     NVARCHAR (50)  NULL,
    [manager_path]             NVARCHAR (128) NULL,
    [criteria_class]           NVARCHAR (256) NULL
);


GO

