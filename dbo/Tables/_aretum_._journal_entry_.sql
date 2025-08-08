CREATE TABLE [dbo].["aretum"."journal_entry"] (
    [fin_document_key]           BIGINT        NULL,
    [reversing]                  NVARCHAR (1)  NULL,
    [reversing_date]             DATETIME2 (6) NULL,
    [reversing_fin_document_key] BIGINT        NULL,
    [historical_data_load_key]   BIGINT        NULL
);


GO

