CREATE TABLE [dbo].["aretum"."lodging_detail"] (
    [expense_data_key] BIGINT          NULL,
    [hotel]            NVARCHAR (100)  NULL,
    [location]         NVARCHAR (100)  NULL,
    [check_in_date]    DATETIME2 (6)   NULL,
    [nights_charged]   INT             NULL,
    [room_rate]        DECIMAL (20, 4) NULL,
    [tax]              DECIMAL (20, 4) NULL,
    [misc_charge]      DECIMAL (20, 4) NULL,
    [misc_desc]        NVARCHAR (100)  NULL
);


GO

