CREATE TABLE [dbo].["aretum"."imported_lodging_detail"] (
    [imported_expense_data_key] BIGINT          NULL,
    [hotel]                     NVARCHAR (100)  NULL,
    [location]                  NVARCHAR (100)  NULL,
    [check_in_date]             DATETIME2 (6)   NULL,
    [nights_charged]            INT             NULL,
    [daily_room_rate]           DECIMAL (20, 4) NULL,
    [daily_room_tax]            DECIMAL (20, 4) NULL,
    [misc_charge]               DECIMAL (20, 4) NULL,
    [misc_desc]                 NVARCHAR (100)  NULL
);


GO

