CREATE TABLE [dbo].["aretum"."expense_data"] (
    [expense_data_key]               BIGINT          NULL,
    [expense_report_key]             BIGINT          NULL,
    [expense_type_key]               BIGINT          NULL,
    [currency_key]                   BIGINT          NULL,
    [payment_method_key]             BIGINT          NULL,
    [expense_date]                   DATETIME2 (6)   NULL,
    [expense_project_allocation_key] BIGINT          NULL,
    [comments]                       NVARCHAR (2000) NULL,
    [amount]                         DECIMAL (20, 4) NULL,
    [summary]                        NVARCHAR (2000) NULL,
    [sequence]                       INT             NULL,
    [receipt_included]               NVARCHAR (1)    NULL,
    [no_receipt_reason]              NVARCHAR (128)  NULL,
    [vendor_key]                     BIGINT          NULL,
    [vendor_name]                    NVARCHAR (255)  NULL,
    [project_type_key]               BIGINT          NULL,
    [exchange_rate]                  DECIMAL (18, 6) NULL,
    [expense_currency]               NVARCHAR (25)   NULL,
    [expense_amount]                 DECIMAL (20, 4) NULL,
    [expense_vat_amount]             DECIMAL (20, 4) NULL,
    [vat_amount]                     DECIMAL (20, 4) NULL,
    [vat_location_key]               BIGINT          NULL,
    [imported_expense_data_key]      BIGINT          NULL,
    [parent_key]                     BIGINT          NULL,
    [last_update]                    DATETIME2 (6)   NULL,
    [transaction_currency]           BIGINT          NULL
);


GO

