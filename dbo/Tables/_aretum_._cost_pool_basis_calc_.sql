CREATE TABLE [dbo].["aretum"."cost_pool_basis_calc"] (
    [cost_pool_basis_calc_key] BIGINT          NULL,
    [cost_pool_calc_key]       BIGINT          NULL,
    [account_key]              BIGINT          NULL,
    [customer_key]             BIGINT          NULL,
    [post_account_key]         BIGINT          NULL,
    [post_customer_key]        BIGINT          NULL,
    [amount]                   DECIMAL (20, 4) NULL,
    [alloc_amount]             DECIMAL (20, 4) NULL
);


GO

