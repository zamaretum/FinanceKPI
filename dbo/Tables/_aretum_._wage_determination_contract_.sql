CREATE TABLE [dbo].["aretum"."wage_determination_contract"] (
    [wage_det_contract_key]  BIGINT        NULL,
    [wage_determination_key] BIGINT        NULL,
    [contract_key]           BIGINT        NULL,
    [start_date]             DATETIME2 (6) NULL,
    [end_date]               DATETIME2 (6) NULL,
    [active]                 NVARCHAR (1)  NULL
);


GO

