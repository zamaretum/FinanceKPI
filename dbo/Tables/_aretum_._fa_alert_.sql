CREATE TABLE [dbo].["aretum"."fa_alert"] (
    [fa_alert_key]      BIGINT          NULL,
    [account_key]       BIGINT          NULL,
    [amount]            DECIMAL (20, 4) NULL,
    [legal_entity_key]  BIGINT          NULL,
    [description]       NVARCHAR (128)  NULL,
    [post_date]         DATETIME2 (6)   NULL,
    [feature]           SMALLINT        NULL,
    [document_number]   NVARCHAR (15)   NULL,
    [created_timestamp] DATETIME2 (6)   NULL
);


GO

