CREATE TABLE [dbo].["aretum"."payroll"] (
    [person_key]         BIGINT          NULL,
    [marital_status]     NVARCHAR (1)    NULL,
    [fed_exemptions]     DECIMAL (5)     NULL,
    [sui_tax_code]       NVARCHAR (10)   NULL,
    [state_worked_in]    NVARCHAR (2)    NULL,
    [immigration_status] NVARCHAR (5)    NULL,
    [rate_change_date]   DATETIME2 (6)   NULL,
    [hire_date]          DATETIME2 (6)   NULL,
    [rate_change]        DECIMAL (12, 4) NULL,
    [eeo_code]           NVARCHAR (20)   NULL,
    [medical_plan]       NVARCHAR (50)   NULL
);


GO

