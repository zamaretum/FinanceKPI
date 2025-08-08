CREATE TABLE [dbo].["aretum"."expense_policy"] (
    [expense_policy_key] BIGINT          NULL,
    [name]               NVARCHAR (50)   NULL,
    [description]        NVARCHAR (2000) NULL,
    [currency_code_key]  BIGINT          NULL,
    [system_default]     NVARCHAR (1)    NULL
);


GO

