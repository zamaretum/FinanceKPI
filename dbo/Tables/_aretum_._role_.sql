CREATE TABLE [dbo].["aretum"."role"] (
    [role_key]         BIGINT        NULL,
    [role_name]        NVARCHAR (25) NULL,
    [role_description] NVARCHAR (50) NULL,
    [assignable]       NVARCHAR (1)  NULL,
    [deleteable]       NVARCHAR (1)  NULL,
    [editable]         NVARCHAR (1)  NULL,
    [category]         SMALLINT      NULL
);


GO

