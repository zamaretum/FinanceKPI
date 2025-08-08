CREATE TABLE [dbo].["aretum"."hdl_billing_detail"] (
    [hdl_billing_detail_key]   BIGINT          NULL,
    [historical_data_load_key] BIGINT          NULL,
    [hdl_cost_detail_key]      BIGINT          NULL,
    [category]                 SMALLINT        NULL,
    [post_date]                DATETIME2 (6)   NULL,
    [post_account_key]         BIGINT          NULL,
    [post_org_key]             BIGINT          NULL,
    [amount]                   DECIMAL (20, 4) NULL,
    [local_amount]             DECIMAL (20, 4) NULL,
    [instance_amount]          DECIMAL (20, 4) NULL
);


GO

