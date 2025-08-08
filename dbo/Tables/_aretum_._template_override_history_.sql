CREATE TABLE [dbo].["aretum"."template_override_history"] (
    [history_key]             BIGINT          NULL,
    [template_key]            BIGINT          NULL,
    [name]                    NVARCHAR (200)  NULL,
    [old_value]               NVARCHAR (4000) NULL,
    [new_value]               NVARCHAR (4000) NULL,
    [last_modified_by]        BIGINT          NULL,
    [last_modified_timestamp] DATETIME2 (6)   NULL
);


GO

