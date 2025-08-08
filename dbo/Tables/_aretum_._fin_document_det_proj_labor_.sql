CREATE TABLE [dbo].["aretum"."fin_document_det_proj_labor"] (
    [fin_document_detail_key] BIGINT          NULL,
    [project_key]             BIGINT          NULL,
    [task_key]                BIGINT          NULL,
    [project_type_key]        BIGINT          NULL,
    [labor_category_key]      BIGINT          NULL,
    [hours]                   DECIMAL (15, 2) NULL,
    [cost_rate]               DECIMAL (15, 5) NULL
);


GO

