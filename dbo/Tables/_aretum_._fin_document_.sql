CREATE TABLE [dbo].["aretum"."fin_document"] (
    [fin_document_key]               BIGINT          NULL,
    [legal_entity_key]               BIGINT          NULL,
    [document_type]                  SMALLINT        NULL,
    [document_number]                NVARCHAR (15)   NULL,
    [document_date]                  DATETIME2 (6)   NULL,
    [post_date]                      DATETIME2 (6)   NULL,
    [last_updated_by]                BIGINT          NULL,
    [created_by]                     BIGINT          NULL,
    [submitted_by]                   BIGINT          NULL,
    [posted_by]                      BIGINT          NULL,
    [last_updated_timestamp]         DATETIME2 (6)   NULL,
    [created_timestamp]              DATETIME2 (6)   NULL,
    [submitted_timestamp]            DATETIME2 (6)   NULL,
    [posted_timestamp]               DATETIME2 (6)   NULL,
    [reference]                      NVARCHAR (50)   NULL,
    [description]                    NVARCHAR (128)  NULL,
    [comments]                       NVARCHAR (2000) NULL,
    [voiding_fin_document_key]       BIGINT          NULL,
    [voided_fin_document_key]        BIGINT          NULL,
    [status]                         NVARCHAR (25)   NULL,
    [currency]                       BIGINT          NULL,
    [local_currency]                 BIGINT          NULL,
    [local_exchange_rate]            DECIMAL (18, 6) NULL,
    [instance_exchange_rate]         DECIMAL (18, 6) NULL,
    [local_exchange_rate_overridden] NVARCHAR (1)    NULL,
    [system_local_exchange_rate]     DECIMAL (18, 6) NULL
);


GO

