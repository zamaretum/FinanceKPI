CREATE TABLE [dbo].["aretum"."invcd_cost_plus_post_detail"] (
    [invoice_key]               BIGINT          NULL,
    [cost_plus_post_detail_key] BIGINT          NULL,
    [project_key]               BIGINT          NULL,
    [task_key]                  BIGINT          NULL,
    [expense_type_key]          BIGINT          NULL,
    [person_key]                BIGINT          NULL,
    [base_cost_element_key]     BIGINT          NULL,
    [cost_element_key]          BIGINT          NULL,
    [fee_method_key]            BIGINT          NULL,
    [labor_category_key]        BIGINT          NULL,
    [location_key]              BIGINT          NULL,
    [pay_code_key]              BIGINT          NULL,
    [item_date]                 DATETIME2 (6)   NULL,
    [comments]                  NVARCHAR (2000) NULL,
    [customer_vendor_key]       BIGINT          NULL,
    [exp_vendor_key]            BIGINT          NULL,
    [exp_vendor_name]           NVARCHAR (255)  NULL,
    [rate]                      DECIMAL (16, 6) NULL,
    [quantity]                  DECIMAL (19, 6) NULL,
    [bill_amount]               DECIMAL (20, 4) NULL,
    [writeoff_amount]           DECIMAL (20, 4) NULL,
    [writeoff_quantity]         DECIMAL (19, 6) NULL,
    [document_type]             NVARCHAR (2)    NULL,
    [document_number]           NVARCHAR (15)   NULL,
    [reference]                 NVARCHAR (255)  NULL,
    [item_key]                  BIGINT          NULL,
    [uom_key]                   BIGINT          NULL,
    [local_writeoff_amount]     DECIMAL (20, 4) NULL,
    [instance_writeoff_amount]  DECIMAL (20, 4) NULL,
    [local_bill_amount]         DECIMAL (20, 4) NULL,
    [instance_bill_amount]      DECIMAL (20, 4) NULL,
    [cost_currency]             BIGINT          NULL
);


GO

