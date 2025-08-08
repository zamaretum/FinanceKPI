CREATE TABLE [dbo].["aretum"."expense_budget_view"] (
    [expense_budget_type] INT             NULL,
    [customer_key]        BIGINT          NULL,
    [project_org_code]    NVARCHAR (25)   NULL,
    [project_key]         BIGINT          NULL,
    [project_code]        NVARCHAR (30)   NULL,
    [task_key]            BIGINT          NULL,
    [task_name]           NVARCHAR (MAX)  NULL,
    [expense_type]        NVARCHAR (25)   NULL,
    [expense_type_name]   NVARCHAR (50)   NULL,
    [master_markup]       DECIMAL (5, 2)  NULL,
    [project_markup]      DECIMAL (5, 2)  NULL,
    [expense_type_key]    BIGINT          NULL,
    [description]         NVARCHAR (50)   NULL,
    [begin_date]          DATETIME2 (6)   NULL,
    [end_date]            DATETIME2 (6)   NULL,
    [amount]              DECIMAL (20, 4) NULL,
    [use_wbs_dates]       NVARCHAR (1)    NULL
);


GO

