CREATE TABLE [dbo].["aretum"."contract_clause"] (
    [clause_key]    BIGINT          NULL,
    [clause_number] NVARCHAR (64)   NULL,
    [clause_title]  NVARCHAR (255)  NULL,
    [agency_key]    BIGINT          NULL,
    [active]        NVARCHAR (1)    NULL,
    [description]   NVARCHAR (4000) NULL
);


GO

