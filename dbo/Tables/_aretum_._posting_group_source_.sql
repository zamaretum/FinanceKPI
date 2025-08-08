CREATE TABLE [dbo].["aretum"."posting_group_source"] (
    [posting_group_source_key] BIGINT       NULL,
    [posting_group_key]        BIGINT       NULL,
    [category]                 SMALLINT     NULL,
    [account_key]              BIGINT       NULL,
    [account_source]           NVARCHAR (1) NULL,
    [org_source]               NVARCHAR (1) NULL,
    [legal_entity]             NVARCHAR (1) NULL,
    [pay_code]                 NVARCHAR (1) NULL,
    [project_type]             NVARCHAR (1) NULL,
    [project]                  NVARCHAR (1) NULL,
    [task]                     NVARCHAR (1) NULL,
    [employee_type]            NVARCHAR (1) NULL,
    [labor_category]           NVARCHAR (1) NULL,
    [cost_element]             NVARCHAR (1) NULL,
    [person]                   NVARCHAR (1) NULL,
    [expense_type]             NVARCHAR (1) NULL,
    [onetime_charge_type]      NVARCHAR (1) NULL,
    [payment_method]           NVARCHAR (1) NULL,
    [fixed_asset_class]        NVARCHAR (1) NULL
);


GO

