CREATE TABLE [dbo].["aretum"."pay_code_rate"] (
    [pay_code_rate_key] BIGINT          NULL,
    [pay_code_key]      BIGINT          NULL,
    [begin_date]        DATETIME2 (6)   NULL,
    [end_date]          DATETIME2 (6)   NULL,
    [rate]              DECIMAL (15, 5) NULL
);


GO

