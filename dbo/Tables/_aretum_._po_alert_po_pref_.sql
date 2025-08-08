CREATE TABLE [dbo].["aretum"."po_alert_po_pref"] (
    [po_key]                        BIGINT       NULL,
    [alert_level]                   NVARCHAR (6) NULL,
    [show_to_purchaser]             NVARCHAR (1) NULL,
    [show_to_po_owner]              NVARCHAR (1) NULL,
    [show_to_receiver]              NVARCHAR (1) NULL,
    [show_to_receiver_alt]          NVARCHAR (1) NULL,
    [email_alert]                   NVARCHAR (1) NULL,
    [summary_expenditure_alert]     NVARCHAR (1) NULL,
    [line_expenditure_alert]        NVARCHAR (1) NULL,
    [hours_charged_alert]           NVARCHAR (1) NULL,
    [summary_expenditure_alert_pct] SMALLINT     NULL,
    [line_expenditure_alert_pct]    SMALLINT     NULL,
    [hours_charged_alert_pct]       SMALLINT     NULL
);


GO

