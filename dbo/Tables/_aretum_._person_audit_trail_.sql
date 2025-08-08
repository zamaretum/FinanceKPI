CREATE TABLE [dbo].["aretum"."person_audit_trail"] (
    [person_audit_trail_key] BIGINT        NULL,
    [person_key]             BIGINT        NULL,
    [modified_by]            BIGINT        NULL,
    [modified_date]          DATETIME2 (6) NULL,
    [old_active_value]       NVARCHAR (1)  NULL,
    [new_active_value]       NVARCHAR (1)  NULL
);


GO

