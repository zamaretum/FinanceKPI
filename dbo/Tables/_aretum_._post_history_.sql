CREATE TABLE [dbo].["aretum"."post_history"] (
    [post_history_key]         BIGINT        NULL,
    [post_timestamp]           DATETIME2 (6) NULL,
    [document_number]          NVARCHAR (15) NULL,
    [actuals_through_date]     DATETIME2 (6) NULL,
    [journal_trans_date]       DATETIME2 (6) NULL,
    [cp_recalc_begin_date]     DATETIME2 (6) NULL,
    [cp_recalc_end_date]       DATETIME2 (6) NULL,
    [posted_by_key]            BIGINT        NULL,
    [time_date_type]           NVARCHAR (1)  NULL,
    [expense_date_type]        NVARCHAR (1)  NULL,
    [bill_pool_rate_type]      NVARCHAR (1)  NULL,
    [recog_pool_rate_type]     NVARCHAR (1)  NULL,
    [use_financial_orgs]       NVARCHAR (1)  NULL,
    [feature]                  SMALLINT      NULL,
    [post_to_gl]               NVARCHAR (1)  NULL,
    [gl_post_level]            SMALLINT      NULL,
    [gl_post_level_offset]     SMALLINT      NULL,
    [gl_post_level_offset_alt] SMALLINT      NULL,
    [post_labor_cross_charge]  NVARCHAR (1)  NULL,
    [post_fp_billable]         NVARCHAR (1)  NULL,
    [post_fp_revenue]          NVARCHAR (1)  NULL,
    [historical_data_load_key] BIGINT        NULL,
    [actuals_from_date]        DATETIME2 (6) NULL,
    [post_ic_expense_cost]     NVARCHAR (1)  NULL,
    [post_ic_expense_revenue]  NVARCHAR (1)  NULL,
    [post_ic_labor_cost]       NVARCHAR (1)  NULL,
    [post_ic_labor_revenue]    NVARCHAR (1)  NULL
);


GO

