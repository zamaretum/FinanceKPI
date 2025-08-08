CREATE TABLE [dbo].["aretum"."cost_struct_pool_rate"] (
    [cost_struct_pool_rate_key] BIGINT           NULL,
    [cost_struct_pool_key]      BIGINT           NULL,
    [fiscal_year_key]           BIGINT           NULL,
    [modifier_key]              BIGINT           NULL,
    [modified_date]             DATETIME2 (6)    NULL,
    [target_rate]               DECIMAL (15, 12) NULL,
    [provisional_rate]          DECIMAL (15, 12) NULL,
    [actual_rate]               DECIMAL (15, 12) NULL
);


GO

