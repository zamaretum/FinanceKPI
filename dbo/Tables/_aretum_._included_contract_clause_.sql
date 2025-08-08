CREATE TABLE [dbo].["aretum"."included_contract_clause"] (
    [contract_key]   BIGINT          NULL,
    [clause_key]     BIGINT          NULL,
    [effective_date] DATETIME2 (6)   NULL,
    [flow_down]      NVARCHAR (1)    NULL,
    [comments]       NVARCHAR (2000) NULL
);


GO

