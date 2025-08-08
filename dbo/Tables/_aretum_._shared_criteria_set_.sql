CREATE TABLE [dbo].["aretum"."shared_criteria_set"] (
    [shared_criteria_set_key] BIGINT         NULL,
    [name]                    NVARCHAR (50)  NULL,
    [target_path]             NVARCHAR (128) NULL,
    [manager_path]            NVARCHAR (128) NULL,
    [criteria_class]          NVARCHAR (256) NULL,
    [chart]                   NVARCHAR (1)   NULL,
    [modified_by]             BIGINT         NULL,
    [modified_date]           DATETIME2 (6)  NULL
);


GO

