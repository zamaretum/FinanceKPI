CREATE TABLE [dbo].["aretum"."data_criteria"] (
    [data_criteria_key]       BIGINT          NULL,
    [data_criteria_type_key]  BIGINT          NULL,
    [name]                    NVARCHAR (50)   NULL,
    [description]             NVARCHAR (128)  NULL,
    [active]                  NVARCHAR (1)    NULL,
    [criteria]                VARBINARY (MAX) NULL,
    [created_timestamp]       DATETIME2 (6)   NULL,
    [last_modified_timestamp] DATETIME2 (6)   NULL
);


GO

