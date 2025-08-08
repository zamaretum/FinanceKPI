CREATE TABLE [dbo].["aretum"."cost_report_element"] (
    [cost_report_element_key] BIGINT          NULL,
    [cost_report_key]         BIGINT          NULL,
    [cost_report_element]     NVARCHAR (128)  NULL,
    [sequence]                SMALLINT        NULL,
    [actuals_formula]         NVARCHAR (3500) NULL,
    [budget_formula]          NVARCHAR (3500) NULL,
    [value_format]            NVARCHAR (1)    NULL,
    [total_ind]               NVARCHAR (1)    NULL,
    [use_in_rev_report]       NVARCHAR (1)    NULL
);


GO

