CREATE TABLE [dbo].["aretum"."cost_struct_pool"] (
    [cost_struct_pool_key] BIGINT          NULL,
    [cost_struct_key]      BIGINT          NULL,
    [cost_element_key]     BIGINT          NULL,
    [display_sequence]     SMALLINT        NULL,
    [process_sequence]     SMALLINT        NULL,
    [formula]              NVARCHAR (4000) NULL,
    [description]          NVARCHAR (128)  NULL
);


GO

