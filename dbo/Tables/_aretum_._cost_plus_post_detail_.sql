CREATE TABLE [dbo].["aretum"."cost_plus_post_detail"] (
    [cost_plus_post_detail_key]    BIGINT          NULL,
    [project_key]                  BIGINT          NULL,
    [time_data_key]                BIGINT          NULL,
    [expense_data_allocation_key]  BIGINT          NULL,
    [fin_document_det_expense_key] BIGINT          NULL,
    [cost_element_key]             BIGINT          NULL,
    [fee_method_key]               BIGINT          NULL,
    [post_history_key]             BIGINT          NULL,
    [invoice_key]                  BIGINT          NULL,
    [bill_amount]                  DECIMAL (20, 4) NULL,
    [recognize_amount]             DECIMAL (20, 4) NULL,
    [task_key]                     BIGINT          NULL,
    [fin_document_det_item_key]    BIGINT          NULL,
    [fin_document_det_labor_key]   BIGINT          NULL,
    [local_bill_amount]            DECIMAL (20, 4) NULL,
    [instance_bill_amount]         DECIMAL (20, 4) NULL,
    [local_recognize_amount]       DECIMAL (20, 4) NULL,
    [instance_recognize_amount]    DECIMAL (20, 4) NULL
);


GO

