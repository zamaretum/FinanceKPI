CREATE TABLE [dbo].["aretum"."invoice_format"] (
    [invoice_format_key]         BIGINT         NULL,
    [name]                       NVARCHAR (50)  NULL,
    [description]                NVARCHAR (128) NULL,
    [active]                     NVARCHAR (1)   NULL,
    [ar_balance]                 NVARCHAR (1)   NULL,
    [invoiced_to_date]           NVARCHAR (1)   NULL,
    [inception_to_date]          NVARCHAR (1)   NULL,
    [remit_to_one_line]          NVARCHAR (1)   NULL,
    [group_by_project]           NVARCHAR (1)   NULL,
    [show_project_funded_value]  NVARCHAR (1)   NULL,
    [show_proj_rem_funded]       NVARCHAR (1)   NULL,
    [show_project_order_number]  NVARCHAR (1)   NULL,
    [project_show_customer_code] NVARCHAR (1)   NULL,
    [project_show_project_code]  NVARCHAR (1)   NULL,
    [project_show_title]         NVARCHAR (1)   NULL,
    [group_by_task]              NVARCHAR (1)   NULL,
    [show_task_funded_value]     NVARCHAR (1)   NULL,
    [show_task_rem_funded]       NVARCHAR (1)   NULL,
    [task_group_level]           SMALLINT       NULL,
    [task_show_number]           NVARCHAR (1)   NULL,
    [task_show_name]             NVARCHAR (1)   NULL,
    [show_billing_period]        NVARCHAR (1)   NULL
);


GO

