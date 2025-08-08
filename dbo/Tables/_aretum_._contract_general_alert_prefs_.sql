CREATE TABLE [dbo].["aretum"."contract_general_alert_prefs"] (
    [person_key]                 BIGINT        NULL,
    [show_to_cm]                 NVARCHAR (1)  NULL,
    [email_alert]                NVARCHAR (1)  NULL,
    [allocation_alert1]          NVARCHAR (1)  NULL,
    [allocation_pct1]            SMALLINT      NULL,
    [allocation_alert2]          NVARCHAR (1)  NULL,
    [allocation_pct2]            SMALLINT      NULL,
    [fully_spent_alert]          NVARCHAR (1)  NULL,
    [fully_spent_exceeded_alert] NVARCHAR (1)  NULL,
    [last_updated_timestamp]     DATETIME2 (6) NULL
);


GO

