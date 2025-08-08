CREATE TABLE [dbo].["aretum"."template_org_history"] (
    [history_key]             BIGINT        NULL,
    [org_key]                 BIGINT        NULL,
    [old_template_key]        BIGINT        NULL,
    [new_template_key]        BIGINT        NULL,
    [last_modified_by]        BIGINT        NULL,
    [last_modified_timestamp] DATETIME2 (6) NULL
);


GO

