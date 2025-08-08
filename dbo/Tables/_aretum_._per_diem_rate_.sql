CREATE TABLE [dbo].["aretum"."per_diem_rate"] (
    [per_diem_rate_key]  BIGINT          NULL,
    [country_state_name] NVARCHAR (45)   NULL,
    [city_county_name]   NVARCHAR (45)   NULL,
    [effective_date]     DATETIME2 (6)   NULL,
    [expiration_date]    DATETIME2 (6)   NULL,
    [season_start_date]  DATETIME2 (6)   NULL,
    [season_end_date]    DATETIME2 (6)   NULL,
    [lodging_rate]       DECIMAL (20, 4) NULL,
    [meals_rate]         DECIMAL (20, 4) NULL,
    [incidentals_rate]   DECIMAL (20, 4) NULL,
    [enabled]            NVARCHAR (1)    NULL,
    [oconus_indicator]   NVARCHAR (1)    NULL
);


GO

