CREATE TABLE [dbo].["aretum"."unatable_state"] (
    [person_key]    BIGINT          NULL,
    [action_path]   NVARCHAR (128)  NULL,
    [table_id]      NVARCHAR (128)  NULL,
    [table_state]   VARBINARY (MAX) NULL,
    [modified_date] DATETIME2 (6)   NULL
);


GO

