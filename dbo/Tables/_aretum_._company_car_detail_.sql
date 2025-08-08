CREATE TABLE [dbo].["aretum"."company_car_detail"] (
    [expense_data_key] BIGINT          NULL,
    [gas_cost]         DECIMAL (20, 4) NULL,
    [gas_cost_gallons] DECIMAL (10, 1) NULL,
    [oil_cost]         DECIMAL (20, 4) NULL,
    [oil_cost_quarts]  DECIMAL (10, 1) NULL,
    [tolls]            DECIMAL (20, 4) NULL,
    [registration]     DECIMAL (20, 4) NULL,
    [repairs]          DECIMAL (20, 4) NULL,
    [maintenance]      DECIMAL (20, 4) NULL,
    [car_wash]         DECIMAL (20, 4) NULL,
    [tires]            DECIMAL (20, 4) NULL,
    [license]          DECIMAL (20, 4) NULL,
    [misc]             DECIMAL (20, 4) NULL,
    [misc_comments]    NVARCHAR (2000) NULL,
    [provider]         NVARCHAR (32)   NULL,
    [vehicle_number]   NVARCHAR (32)   NULL,
    [odo_start]        DECIMAL (10, 1) NULL,
    [odo_end]          DECIMAL (10, 1) NULL,
    [location]         NVARCHAR (64)   NULL,
    [mileage_business] DECIMAL (10, 1) NULL,
    [mileage_personal] DECIMAL (10, 1) NULL,
    [rate]             DECIMAL (15, 4) NULL
);


GO

