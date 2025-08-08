CREATE TABLE [dbo].["aretum"."po_labor_assignment"] (
    [po_labor_assignment_key]      BIGINT          NULL,
    [po_key]                       BIGINT          NULL,
    [po_labor_line_descriptor_key] BIGINT          NULL,
    [person_key]                   BIGINT          NULL,
    [project_key]                  BIGINT          NULL,
    [task_key]                     BIGINT          NULL,
    [labor_category_key]           BIGINT          NULL,
    [cost_rate]                    DECIMAL (15, 5) NULL,
    [begin_date]                   DATETIME2 (6)   NULL,
    [end_date]                     DATETIME2 (6)   NULL,
    [last_updated_timestamp]       DATETIME2 (6)   NULL
);


GO

