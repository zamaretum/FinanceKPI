CREATE TABLE [dbo].["aretum"."mie_per_diem_detail"] (
    [expense_data_key]   BIGINT          NULL,
    [country_state_name] NVARCHAR (45)   NULL,
    [city_county_name]   NVARCHAR (45)   NULL,
    [rate]               DECIMAL (20, 4) NULL,
    [first_day]          NVARCHAR (1)    NULL,
    [last_day]           NVARCHAR (1)    NULL,
    [breakfast_provided] NVARCHAR (1)    NULL,
    [lunch_provided]     NVARCHAR (1)    NULL,
    [dinner_provided]    NVARCHAR (1)    NULL
);


GO

