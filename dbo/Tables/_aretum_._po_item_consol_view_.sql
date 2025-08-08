CREATE TABLE [dbo].["aretum"."po_item_consol_view"] (
    [current_po_key]              BIGINT          NULL,
    [line_id]                     SMALLINT        NULL,
    [po_item_line_descriptor_key] BIGINT          NULL,
    [orig_po_key]                 BIGINT          NULL,
    [owning_po_key]               BIGINT          NULL,
    [pr_item_line_descriptor_key] BIGINT          NULL,
    [account_key]                 BIGINT          NULL,
    [organization_key]            BIGINT          NULL,
    [reference]                   NVARCHAR (25)   NULL,
    [description]                 NVARCHAR (128)  NULL,
    [project_key]                 BIGINT          NULL,
    [task_key]                    BIGINT          NULL,
    [item_key]                    BIGINT          NULL,
    [uom_key]                     BIGINT          NULL,
    [person_key]                  BIGINT          NULL,
    [rate]                        DECIMAL (15, 5) NULL,
    [control_quantity]            NVARCHAR (1)    NULL,
    [closed_date]                 DATETIME2 (6)   NULL,
    [po_item_line_key]            BIGINT          NULL,
    [line_po_key]                 BIGINT          NULL,
    [begin_date]                  DATETIME2 (6)   NULL,
    [end_date]                    DATETIME2 (6)   NULL,
    [required_by_date]            DATETIME2 (6)   NULL,
    [internal_comments]           NVARCHAR (2000) NULL,
    [external_comments]           NVARCHAR (2000) NULL,
    [vi_overage]                  NVARCHAR (1)    NULL,
    [quantity]                    NVARCHAR (MAX)  NULL,
    [amount]                      NVARCHAR (MAX)  NULL,
    [promised_date]               DATETIME2 (6)   NULL,
    [detail_type]                 NVARCHAR (25)   NULL
);


GO

