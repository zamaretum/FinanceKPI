CREATE TABLE [dbo].["aretum"."imported_expense_data"] (
    [imported_expense_data_key] BIGINT          NULL,
    [import_date]               DATETIME2 (6)   NULL,
    [import_source]             BIGINT          NULL,
    [wizard_type]               DECIMAL (2)     NULL,
    [expense_date]              DATETIME2 (6)   NULL,
    [expense_amount]            DECIMAL (20, 4) NULL,
    [expense_vat_amount]        DECIMAL (20, 4) NULL,
    [expense_currency_code]     NVARCHAR (25)   NULL,
    [amount]                    DECIMAL (20, 4) NULL,
    [vat_amount]                DECIMAL (20, 4) NULL,
    [amount_currency_code]      NVARCHAR (25)   NULL,
    [exchange_rate]             DECIMAL (18, 6) NULL,
    [vendor_name]               NVARCHAR (255)  NULL,
    [payment_method_key]        BIGINT          NULL,
    [receipt_included]          NVARCHAR (1)    NULL,
    [comments]                  NVARCHAR (2000) NULL,
    [no_receipt_reason]         NVARCHAR (128)  NULL,
    [vat_location_name]         NVARCHAR (50)   NULL,
    [currency]                  BIGINT          NULL,
    [transaction_currency]      BIGINT          NULL
);


GO

