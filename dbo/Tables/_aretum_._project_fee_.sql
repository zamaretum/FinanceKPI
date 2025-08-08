CREATE TABLE [dbo].["aretum"."project_fee"] (
    [project_key]      BIGINT          NULL,
    [fee_method_key]   BIGINT          NULL,
    [fee_factor_type]  NVARCHAR (1)    NULL,
    [fee_factor]       DECIMAL (5, 2)  NULL,
    [fixed_fee_amount] DECIMAL (17, 4) NULL
);


GO

