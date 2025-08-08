CREATE TABLE [dbo].["aretum"."exchange_rate"] (
    [exchange_rate_key]      BIGINT          NULL,
    [exchange_rate_type_key] BIGINT          NULL,
    [from_currency]          BIGINT          NULL,
    [to_currency]            BIGINT          NULL,
    [from_date]              DATETIME2 (6)   NULL,
    [to_date]                DATETIME2 (6)   NULL,
    [exchange_rate]          DECIMAL (18, 6) NULL
);


GO

