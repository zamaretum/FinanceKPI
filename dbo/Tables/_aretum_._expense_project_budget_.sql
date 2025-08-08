CREATE TABLE [dbo].["aretum"."expense_project_budget"] (
    [expense_project_budget_key] BIGINT          NULL,
    [project_key]                BIGINT          NULL,
    [expense_type_key]           BIGINT          NULL,
    [description]                NVARCHAR (50)   NULL,
    [begin_date]                 DATETIME2 (6)   NULL,
    [end_date]                   DATETIME2 (6)   NULL,
    [amount]                     DECIMAL (20, 4) NULL,
    [use_wbs_dates]              NVARCHAR (1)    NULL
);


GO

