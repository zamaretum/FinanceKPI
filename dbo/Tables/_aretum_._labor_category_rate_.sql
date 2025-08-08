CREATE TABLE [dbo].["aretum"."labor_category_rate"] (
    [labor_category_rate_key] BIGINT          NULL,
    [labor_category_key]      BIGINT          NULL,
    [begin_date]              DATETIME2 (6)   NULL,
    [end_date]                DATETIME2 (6)   NULL,
    [bill_rate]               DECIMAL (15, 5) NULL,
    [cost_rate]               DECIMAL (15, 5) NULL
);


GO

