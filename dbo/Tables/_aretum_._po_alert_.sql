CREATE TABLE [dbo].["aretum"."po_alert"] (
    [po_alert_key] BIGINT        NULL,
    [po_key]       BIGINT        NULL,
    [alert_type]   SMALLINT      NULL,
    [threshold]    SMALLINT      NULL,
    [created]      DATETIME2 (6) NULL
);


GO

