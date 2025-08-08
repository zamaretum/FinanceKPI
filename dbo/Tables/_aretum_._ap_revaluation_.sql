CREATE TABLE [dbo].["aretum"."ap_revaluation"] (
    [ap_revaluation_key]     BIGINT        NULL,
    [document_number]        NVARCHAR (15) NULL,
    [legal_entity_key]       BIGINT        NULL,
    [fiscal_month_key]       BIGINT        NULL,
    [exchange_rate_type_key] BIGINT        NULL,
    [revalued_by]            BIGINT        NULL,
    [revaluation_timestamp]  DATETIME2 (6) NULL,
    [posted_by]              BIGINT        NULL,
    [posted_timestamp]       DATETIME2 (6) NULL
);


GO

