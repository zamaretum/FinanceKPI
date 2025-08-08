CREATE TABLE [dbo].["aretum"."lodging_allowable_detail"] (
    [expense_data_key]   BIGINT          NULL,
    [country_state_name] NVARCHAR (45)   NULL,
    [city_county_name]   NVARCHAR (45)   NULL,
    [rate]               DECIMAL (20, 4) NULL,
    [prorated_rate]      DECIMAL (20, 4) NULL,
    [special_situation]  NVARCHAR (1)    NULL,
    [check_in_date]      DATETIME2 (6)   NULL,
    [nights_charged]     INT             NULL,
    [daily_room_rate]    DECIMAL (20, 4) NULL,
    [daily_room_tax]     DECIMAL (20, 4) NULL,
    [overage]            DECIMAL (20, 4) NULL
);


GO

