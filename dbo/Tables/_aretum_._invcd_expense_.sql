CREATE TABLE [dbo].["aretum"."invcd_expense"] (
    [invoice_key]                 BIGINT          NULL,
    [expense_data_allocation_key] BIGINT          NULL,
    [writeoff_cost]               DECIMAL (20, 4) NULL,
    [writeoff_markup]             DECIMAL (5, 2)  NULL,
    [writeoff_amount]             DECIMAL (20, 4) NULL,
    [local_writeoff_amount]       DECIMAL (20, 4) NULL,
    [instance_writeoff_amount]    DECIMAL (20, 4) NULL
);


GO

