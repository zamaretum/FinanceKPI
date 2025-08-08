CREATE TABLE [dbo].["aretum"."contract_alert"] (
    [alert_key]      BIGINT        NULL,
    [contract_key]   BIGINT        NULL,
    [alert_type]     SMALLINT      NULL,
    [threshold]      SMALLINT      NULL,
    [created]        DATETIME2 (6) NULL,
    [allocation_key] BIGINT        NULL
);


GO

