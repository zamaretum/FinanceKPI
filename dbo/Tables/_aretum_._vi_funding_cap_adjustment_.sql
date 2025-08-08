CREATE TABLE [dbo].["aretum"."vi_funding_cap_adjustment"] (
    [vi_funding_cap_adjustment_key]  BIGINT          NULL,
    [fin_document_key]               BIGINT          NULL,
    [po_key]                         BIGINT          NULL,
    [po_item_line_descriptor_key]    BIGINT          NULL,
    [po_labor_line_descriptor_key]   BIGINT          NULL,
    [po_expense_line_descriptor_key] BIGINT          NULL,
    [amount]                         DECIMAL (20, 4) NULL,
    [general_ledger_key]             BIGINT          NULL,
    [account_key]                    BIGINT          NULL,
    [organization_key]               BIGINT          NULL,
    [local_amount]                   DECIMAL (20, 4) NULL,
    [instance_amount]                DECIMAL (20, 4) NULL,
    [local_fx_general_ledger_key]    BIGINT          NULL,
    [instance_fx_general_ledger_key] BIGINT          NULL,
    [local_fx_gain]                  DECIMAL (20, 4) NULL,
    [local_fx_loss]                  DECIMAL (20, 4) NULL,
    [instance_fx_gain]               DECIMAL (20, 4) NULL,
    [instance_fx_loss]               DECIMAL (20, 4) NULL
);


GO

