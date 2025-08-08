CREATE TABLE [dbo].["aretum"."fiscal_month"] (
    [fiscal_month_key]   BIGINT        NULL,
    [fiscal_year_key]    BIGINT        NULL,
    [fiscal_quarter_key] BIGINT        NULL,
    [begin_date]         DATETIME2 (6) NULL,
    [end_date]           DATETIME2 (6) NULL,
    [period_number]      SMALLINT      NULL
);


GO

