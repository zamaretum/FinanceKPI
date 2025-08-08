CREATE TABLE [dbo].["aretum"."fiscal_month_org_feature_close"] (
    [fiscal_month_key] BIGINT        NULL,
    [customer_key]     BIGINT        NULL,
    [feature]          SMALLINT      NULL,
    [closed_timestamp] DATETIME2 (6) NULL,
    [closed_by]        BIGINT        NULL
);


GO

