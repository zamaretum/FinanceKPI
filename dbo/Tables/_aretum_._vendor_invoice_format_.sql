CREATE TABLE [dbo].["aretum"."vendor_invoice_format"] (
    [vendor_invoice_format_key]     BIGINT          NULL,
    [name]                          NVARCHAR (50)   NULL,
    [description]                   NVARCHAR (2000) NULL,
    [active]                        NVARCHAR (1)    NULL,
    [ap_balance]                    NVARCHAR (1)    NULL,
    [show_po_funded_value]          NVARCHAR (1)    NULL,
    [show_po_rem_funded_value]      NVARCHAR (1)    NULL,
    [group_by_project]              NVARCHAR (1)    NULL,
    [project_show_customer_code]    NVARCHAR (1)    NULL,
    [project_show_project_code]     NVARCHAR (1)    NULL,
    [project_show_title]            NVARCHAR (1)    NULL,
    [show_po_line_funded_value]     NVARCHAR (1)    NULL,
    [show_po_line_rem_funded_value] NVARCHAR (1)    NULL,
    [group_by_po_line]              NVARCHAR (1)    NULL,
    [system_default]                NVARCHAR (1)    NULL,
    [charge_breakdown]              NVARCHAR (1)    NULL,
    [show_po_description]           NVARCHAR (1)    NULL,
    [show_po_line_description]      NVARCHAR (1)    NULL,
    [show_po_number]                NVARCHAR (1)    NULL,
    [show_po_reference_number]      NVARCHAR (1)    NULL,
    [show_project_task_name]        NVARCHAR (1)    NULL,
    [show_project_task_number]      NVARCHAR (1)    NULL,
    [show_vendor_tax_id]            NVARCHAR (1)    NULL,
    [show_vendor_logo]              NVARCHAR (1)    NULL,
    [show_vendor_memo]              NVARCHAR (1)    NULL,
    [show_tax1]                     NVARCHAR (1)    NULL,
    [show_tax2]                     NVARCHAR (1)    NULL,
    [show_tax3]                     NVARCHAR (1)    NULL
);


GO

