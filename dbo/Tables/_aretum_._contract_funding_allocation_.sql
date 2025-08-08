CREATE TABLE [dbo].["aretum"."contract_funding_allocation"] (
    [allocation_key]           BIGINT          NULL,
    [funding_level_key]        BIGINT          NULL,
    [contract_key]             BIGINT          NULL,
    [funding_id]               NVARCHAR (128)  NULL,
    [parent_key]               BIGINT          NULL,
    [contract_modification]    NVARCHAR (1)    NULL,
    [funded_value]             DECIMAL (17, 4) NULL,
    [funded_cost]              DECIMAL (17, 4) NULL,
    [funded_fee]               DECIMAL (17, 4) NULL,
    [start_date]               DATETIME2 (6)   NULL,
    [end_date]                 DATETIME2 (6)   NULL,
    [retainage]                DECIMAL (17, 4) NULL,
    [retainage_start_date]     DATETIME2 (6)   NULL,
    [retainage_end_date]       DATETIME2 (6)   NULL,
    [comments]                 NVARCHAR (2000) NULL,
    [calculation_method]       NVARCHAR (1)    NULL,
    [calculation_method_seq]   DECIMAL (9)     NULL,
    [calculation_method_ratio] DECIMAL (5, 2)  NULL,
    [created_timestamp]        DATETIME2 (6)   NULL,
    [funded_value_available]   DECIMAL (17, 4) NULL
);


GO

