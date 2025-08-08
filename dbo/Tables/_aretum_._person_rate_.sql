CREATE TABLE [dbo].["aretum"."person_rate"] (
    [person_rate_key]       BIGINT          NULL,
    [person_key]            BIGINT          NULL,
    [cost_struct_labor_key] BIGINT          NULL,
    [bill_rate]             DECIMAL (15, 5) NULL,
    [cost_rate]             DECIMAL (15, 5) NULL,
    [exempt_status]         NVARCHAR (1)    NULL,
    [begin_date]            DATETIME2 (6)   NULL,
    [end_date]              DATETIME2 (6)   NULL,
    [sca_wage_flag]         NVARCHAR (1)    NULL
);


GO

