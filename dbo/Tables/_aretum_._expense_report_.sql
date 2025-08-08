CREATE TABLE [dbo].["aretum"."expense_report"] (
    [expense_report_key]         BIGINT          NULL,
    [purpose]                    NVARCHAR (2000) NULL,
    [location]                   NVARCHAR (255)  NULL,
    [status]                     NVARCHAR (25)   NULL,
    [owner_key]                  BIGINT          NULL,
    [creator_key]                BIGINT          NULL,
    [controller_key]             BIGINT          NULL,
    [created]                    DATETIME2 (6)   NULL,
    [date_completed]             DATETIME2 (6)   NULL,
    [amount]                     DECIMAL (20, 4) NULL,
    [expense_currency]           NVARCHAR (25)   NULL,
    [total_expenses]             DECIMAL (20, 4) NULL,
    [last_update]                DATETIME2 (6)   NULL,
    [post_date]                  DATETIME2 (6)   NULL,
    [voiding_expense_report_key] BIGINT          NULL,
    [voided_expense_report_key]  BIGINT          NULL,
    [currency]                   BIGINT          NULL
);


GO

