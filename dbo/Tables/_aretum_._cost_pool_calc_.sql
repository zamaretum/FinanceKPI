CREATE TABLE [dbo].["aretum"."cost_pool_calc"] (
    [cost_pool_calc_key]       BIGINT           NULL,
    [cost_pool_group_calc_key] BIGINT           NULL,
    [cost_pool_key]            BIGINT           NULL,
    [post_to_gl]               NVARCHAR (1)     NULL,
    [update_rates]             NVARCHAR (1)     NULL,
    [rate]                     DECIMAL (15, 12) NULL,
    [document_number]          NVARCHAR (15)    NULL,
    [voiding_document_number]  NVARCHAR (15)    NULL
);


GO

