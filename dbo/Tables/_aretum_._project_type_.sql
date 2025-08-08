CREATE TABLE [dbo].["aretum"."project_type"] (
    [project_type_key]            BIGINT         NULL,
    [project_type]                NVARCHAR (10)  NULL,
    [description]                 NVARCHAR (100) NULL,
    [administrative]              NVARCHAR (1)   NULL,
    [billable]                    NVARCHAR (1)   NULL,
    [last_project_code_seq]       BIGINT         NULL,
    [start_with_project_code_seq] BIGINT         NULL,
    [active]                      NVARCHAR (1)   NULL
);


GO

