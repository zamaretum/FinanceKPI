CREATE TABLE [dbo].["aretum"."invcd_document_item"] (
    [invoice_key]              BIGINT          NULL,
    [fin_document_detail_key]  BIGINT          NULL,
    [writeoff_cost]            DECIMAL (20, 4) NULL,
    [writeoff_markup]          DECIMAL (5, 2)  NULL,
    [writeoff_quantity]        DECIMAL (15, 6) NULL,
    [writeoff_amount]          DECIMAL (20, 4) NULL,
    [writeoff_bill_rate]       DECIMAL (15, 5) NULL,
    [local_writeoff_amount]    DECIMAL (20, 4) NULL,
    [instance_writeoff_amount] DECIMAL (20, 4) NULL
);


GO

