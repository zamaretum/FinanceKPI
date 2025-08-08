CREATE TABLE [dbo].["aretum"."project_item_uom_rate"] (
    [project_item_uom_rate_key] BIGINT          NULL,
    [project_key]               BIGINT          NULL,
    [item_key]                  BIGINT          NULL,
    [uom_key]                   BIGINT          NULL,
    [begin_date]                DATETIME2 (6)   NULL,
    [end_date]                  DATETIME2 (6)   NULL,
    [bill_rate]                 DECIMAL (15, 5) NULL,
    [bill_markup]               DECIMAL (5, 2)  NULL,
    [cost_rate]                 DECIMAL (15, 5) NULL
);


GO

