CREATE TABLE [dbo].["aretum"."vendor_invoice"] (
    [fin_document_key]          BIGINT          NULL,
    [vendor_org_key]            BIGINT          NULL,
    [invoice_amount]            DECIMAL (20, 4) NULL,
    [invoice_date]              DATETIME2 (6)   NULL,
    [payment_term_key]          BIGINT          NULL,
    [due_date]                  DATETIME2 (6)   NULL,
    [discount_amount]           DECIMAL (20, 4) NULL,
    [discount_date]             DATETIME2 (6)   NULL,
    [separate_payment]          NVARCHAR (1)    NULL,
    [account_key]               BIGINT          NULL,
    [organization_key]          BIGINT          NULL,
    [payment_on_hold]           NVARCHAR (1)    NULL,
    [general_ledger_key]        BIGINT          NULL,
    [hold_reason]               NVARCHAR (255)  NULL,
    [po_key]                    BIGINT          NULL,
    [controller_key]            BIGINT          NULL,
    [receiver_key]              BIGINT          NULL,
    [chain_key]                 BIGINT          NULL,
    [vendor_invoice_format_key] BIGINT          NULL,
    [include_vi_attachments]    NVARCHAR (1)    NULL,
    [include_er_receipts]       NVARCHAR (1)    NULL,
    [hold_dispute]              NVARCHAR (1)    NULL,
    [hold_pwp]                  NVARCHAR (1)    NULL,
    [hold_other]                NVARCHAR (1)    NULL,
    [local_invoice_amount]      DECIMAL (20, 4) NULL,
    [local_discount_amount]     DECIMAL (20, 4) NULL,
    [instance_invoice_amount]   DECIMAL (20, 4) NULL,
    [instance_discount_amount]  DECIMAL (20, 4) NULL
);


GO

