CREATE TABLE [dbo].["aretum"."request_expense_report"] (
    [request_expense_report_key] BIGINT          NULL,
    [voucher_number]             BIGINT          NULL,
    [purpose]                    NVARCHAR (2000) NULL,
    [location]                   NVARCHAR (255)  NULL,
    [status]                     NVARCHAR (255)  NULL,
    [owner_key]                  BIGINT          NULL,
    [owner_name]                 NVARCHAR (255)  NULL,
    [creator_name]               NVARCHAR (255)  NULL,
    [date_completed]             DATETIME2 (6)   NULL,
    [amount]                     DECIMAL (20, 4) NULL,
    [expense_currency]           NVARCHAR (25)   NULL,
    [total_expenses]             DECIMAL (20, 4) NULL,
    [currency]                   BIGINT          NULL
);


GO

