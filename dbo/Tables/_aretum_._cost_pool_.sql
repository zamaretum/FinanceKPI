CREATE TABLE [dbo].["aretum"."cost_pool"] (
    [cost_pool_key]            BIGINT         NULL,
    [cost_pool_name]           NVARCHAR (128) NULL,
    [active]                   NVARCHAR (1)   NULL,
    [source_period]            NVARCHAR (1)   NULL,
    [basis_method]             NVARCHAR (1)   NULL,
    [post_to_gl]               NVARCHAR (1)   NULL,
    [post_rate_to_cost_struct] NVARCHAR (1)   NULL,
    [cost_element_key]         BIGINT         NULL,
    [cost_pool_group_key]      BIGINT         NULL,
    [display_sequence]         SMALLINT       NULL
);


GO

