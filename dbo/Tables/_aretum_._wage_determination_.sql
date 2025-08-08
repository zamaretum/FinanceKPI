CREATE TABLE [dbo].["aretum"."wage_determination"] (
    [wage_determination_key]    BIGINT          NULL,
    [wage_determination_number] NVARCHAR (25)   NULL,
    [revision]                  DECIMAL (5)     NULL,
    [services]                  NVARCHAR (2000) NULL,
    [last_revised_date]         DATETIME2 (6)   NULL,
    [minimum_wage_rate]         DECIMAL (15, 5) NULL,
    [benefit_rate]              DECIMAL (15, 5) NULL,
    [benefit_max_hours]         DECIMAL (15, 5) NULL,
    [paid_sick_leave]           NVARCHAR (1)    NULL,
    [executive_order]           NVARCHAR (25)   NULL
);


GO

