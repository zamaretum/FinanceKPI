CREATE TABLE [dbo].["aretum"."po_item_line_descriptor"] (
    [po_item_line_descriptor_key] BIGINT          NULL,
    [po_key]                      BIGINT          NULL,
    [pr_item_line_descriptor_key] BIGINT          NULL,
    [line_id]                     SMALLINT        NULL,
    [account_key]                 BIGINT          NULL,
    [organization_key]            BIGINT          NULL,
    [reference]                   NVARCHAR (25)   NULL,
    [description]                 NVARCHAR (128)  NULL,
    [project_key]                 BIGINT          NULL,
    [task_key]                    BIGINT          NULL,
    [item_key]                    BIGINT          NULL,
    [uom_key]                     BIGINT          NULL,
    [rate]                        DECIMAL (15, 5) NULL,
    [control_quantity]            NVARCHAR (1)    NULL,
    [person_key]                  BIGINT          NULL,
    [closed_date]                 DATETIME2 (6)   NULL,
    [orig_po_key]                 BIGINT          NULL
);


GO

