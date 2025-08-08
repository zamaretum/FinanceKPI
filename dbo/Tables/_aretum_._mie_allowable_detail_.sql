CREATE TABLE [dbo].["aretum"."mie_allowable_detail"] (
    [expense_data_key]   BIGINT          NULL,
    [country_state_name] NVARCHAR (45)   NULL,
    [city_county_name]   NVARCHAR (45)   NULL,
    [rate]               DECIMAL (20, 4) NULL,
    [prorated_rate]      DECIMAL (20, 4) NULL,
    [overage]            DECIMAL (20, 4) NULL,
    [first_day]          NVARCHAR (1)    NULL,
    [last_day]           NVARCHAR (1)    NULL,
    [breakfast_provided] NVARCHAR (1)    NULL,
    [lunch_provided]     NVARCHAR (1)    NULL,
    [dinner_provided]    NVARCHAR (1)    NULL,
    [breakfast_amount]   DECIMAL (20, 4) NULL,
    [lunch_amount]       DECIMAL (20, 4) NULL,
    [dinner_amount]      DECIMAL (20, 4) NULL
);


GO

