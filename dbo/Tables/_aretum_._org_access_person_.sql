CREATE TABLE [dbo].["aretum"."org_access_person"] (
    [org_access_person_key] BIGINT       NULL,
    [person_key]            BIGINT       NULL,
    [role_key]              BIGINT       NULL,
    [access_type]           DECIMAL (1)  NULL,
    [global_access]         NVARCHAR (1) NULL
);


GO

