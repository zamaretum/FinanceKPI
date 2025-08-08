CREATE TABLE [dbo].["aretum"."onetime_charge_type"] (
    [onetime_charge_type_key] BIGINT        NULL,
    [name]                    NVARCHAR (50) NULL,
    [debit_account_category]  SMALLINT      NULL,
    [credit_account_category] SMALLINT      NULL,
    [active]                  NVARCHAR (1)  NULL
);


GO

