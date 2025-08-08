CREATE TABLE [dbo].["aretum"."po_labor_consol_all_view"] (
    [line_id]                      SMALLINT        NULL,
    [po_labor_line_descriptor_key] BIGINT          NULL,
    [po_labor_line_key]            BIGINT          NULL,
    [orig_po_key]                  BIGINT          NULL,
    [line_po_key]                  BIGINT          NULL,
    [owning_po_key]                BIGINT          NULL,
    [pr_labor_line_descriptor_key] BIGINT          NULL,
    [pr_key]                       BIGINT          NULL,
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
    [begin_date]                   DATETIME2 (6)   NULL,
    [end_date]                     DATETIME2 (6)   NULL,
    [internal_comments]            NVARCHAR (2000) NULL,
    [external_comments]            NVARCHAR (2000) NULL,
    [vi_overage]                   NVARCHAR (1)    NULL,
    [hours]                        NVARCHAR (MAX)  NULL,
    [amount]                       NVARCHAR (MAX)  NULL
);


GO

