CREATE TABLE [dbo].["aretum"."contract_fa_project"] (
    [allocation_key]         BIGINT          NULL,
    [project_key]            BIGINT          NULL,
    [labor_funding_option]   NVARCHAR (1)    NULL,
    [expense_funding_option] NVARCHAR (1)    NULL,
    [item_funding_option]    NVARCHAR (1)    NULL,
    [funded_value]           DECIMAL (17, 4) NULL,
    [funded_value_available] DECIMAL (17, 4) NULL
);


GO

