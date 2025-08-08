CREATE TABLE [dbo].["aretum"."vi_details_view"] (
    [dtl_line_type]                 NVARCHAR (MAX) NULL,
    [dtl_fin_document_key]          BIGINT         NULL,
    [dtl_account_key]               BIGINT         NULL,
    [dtl_org_key]                   BIGINT         NULL,
    [dtl_cost_struct_elem_key]      BIGINT         NULL,
    [dtl_debit]                     NVARCHAR (MAX) NULL,
    [dtl_credit]                    NVARCHAR (MAX) NULL,
    [dtl_description]               NVARCHAR (MAX) NULL,
    [dtl_reference]                 NVARCHAR (MAX) NULL,
    [dtl_expense_type_key]          NVARCHAR (MAX) NULL,
    [dtl_qty]                       NVARCHAR (MAX) NULL,
    [dtl_item_key]                  NVARCHAR (MAX) NULL,
    [dtl_uom_key]                   NVARCHAR (MAX) NULL,
    [dtl_labor_category_key]        BIGINT         NULL,
    [dtl_cost_rate]                 NVARCHAR (MAX) NULL,
    [dtl_person_key]                BIGINT         NULL,
    [dtl_project_key]               BIGINT         NULL,
    [dtl_task_key]                  BIGINT         NULL,
    [dtl_project_type_key]          BIGINT         NULL,
    [dtl_transaction_date]          DATETIME2 (6)  NULL,
    [dtl_po_key]                    BIGINT         NULL,
    [dtl_po_line_key]               BIGINT         NULL,
    [dtl_po_line_id]                SMALLINT       NULL,
    [dtl_po_line_account_key]       BIGINT         NULL,
    [dtl_po_line_org_key]           BIGINT         NULL,
    [dtl_cost_post_exp_account_key] NVARCHAR (MAX) NULL,
    [dtl_cost_post_exp_org_key]     NVARCHAR (MAX) NULL,
    [expense_report_key]            NVARCHAR (MAX) NULL,
    [receiving_document_item_key]   NVARCHAR (MAX) NULL
);


GO

