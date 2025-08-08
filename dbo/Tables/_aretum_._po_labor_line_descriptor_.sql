CREATE TABLE [dbo].["aretum"."po_labor_line_descriptor"] (
    [po_labor_line_descriptor_key] BIGINT          NULL,
    [po_key]                       BIGINT          NULL,
    [pr_labor_line_descriptor_key] BIGINT          NULL,
    [line_id]                      SMALLINT        NULL,
    [account_key]                  BIGINT          NULL,
    [organization_key]             BIGINT          NULL,
    [reference]                    NVARCHAR (25)   NULL,
    [description]                  NVARCHAR (128)  NULL,
    [project_key]                  BIGINT          NULL,
    [task_key]                     BIGINT          NULL,
    [labor_category_key]           BIGINT          NULL,
    [person_key]                   BIGINT          NULL,
    [rate]                         DECIMAL (15, 5) NULL,
    [control_hours]                NVARCHAR (1)    NULL,
    [closed_date]                  DATETIME2 (6)   NULL,
    [orig_po_key]                  BIGINT          NULL
);


GO

