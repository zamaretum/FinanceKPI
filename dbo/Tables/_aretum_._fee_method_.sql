CREATE TABLE [dbo].["aretum"."fee_method"] (
    [fee_method_key]  BIGINT          NULL,
    [fee_method]      NVARCHAR (128)  NULL,
    [actuals_formula] NVARCHAR (3500) NULL,
    [budget_formula]  NVARCHAR (3500) NULL,
    [active]          NVARCHAR (1)    NULL
);


GO

