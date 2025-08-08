CREATE TABLE [dbo].["aretum"."resource_request"] (
    [resource_request_key] BIGINT          NULL,
    [requestor_key]        BIGINT          NULL,
    [project_key]          BIGINT          NULL,
    [task_key]             BIGINT          NULL,
    [title]                NVARCHAR (128)  NULL,
    [description]          NVARCHAR (2000) NULL,
    [budget_units]         NVARCHAR (1)    NULL,
    [budget_by]            NVARCHAR (1)    NULL,
    [status]               NVARCHAR (25)   NULL,
    [status_date]          DATETIME2 (6)   NULL,
    [period_type]          NVARCHAR (10)   NULL,
    [periods]              DECIMAL (2)     NULL,
    [begin_date]           DATETIME2 (6)   NULL,
    [end_date]             DATETIME2 (6)   NULL,
    [plan_set_key]         BIGINT          NULL
);


GO

