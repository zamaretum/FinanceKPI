CREATE TABLE [dbo].["aretum"."contract_mod"] (
    [contract_key]        BIGINT          NULL,
    [mod_number]          SMALLINT        NULL,
    [external_mod_number] NVARCHAR (50)   NULL,
    [modification_date]   DATETIME2 (6)   NULL,
    [project_key]         BIGINT          NULL,
    [begin_date]          DATETIME2 (6)   NULL,
    [end_date]            DATETIME2 (6)   NULL,
    [effective_date]      DATETIME2 (6)   NULL,
    [total_value_adj]     DECIMAL (17, 4) NULL,
    [total_cost_adj]      DECIMAL (17, 4) NULL,
    [total_fee_adj]       DECIMAL (17, 4) NULL,
    [funded_value_adj]    DECIMAL (17, 4) NULL,
    [funded_cost_adj]     DECIMAL (17, 4) NULL,
    [funded_fee_adj]      DECIMAL (17, 4) NULL,
    [contract_comment]    NVARCHAR (4000) NULL,
    [created_by]          BIGINT          NULL,
    [created_date]        DATETIME2 (6)   NULL,
    [edited_by]           BIGINT          NULL,
    [edited_timestamp]    DATETIME2 (6)   NULL
);


GO

