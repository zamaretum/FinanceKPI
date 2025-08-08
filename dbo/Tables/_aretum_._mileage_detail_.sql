CREATE TABLE [dbo].["aretum"."mileage_detail"] (
    [expense_data_key] BIGINT          NULL,
    [from_location]    NVARCHAR (100)  NULL,
    [to_location]      NVARCHAR (100)  NULL,
    [miles]            DECIMAL (15, 2) NULL,
    [rate]             DECIMAL (15, 4) NULL,
    [round_trip]       NVARCHAR (1)    NULL
);


GO

