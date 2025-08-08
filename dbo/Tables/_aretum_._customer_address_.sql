CREATE TABLE [dbo].["aretum"."customer_address"] (
    [customer_address_key]   BIGINT        NULL,
    [customer_key]           BIGINT        NULL,
    [address_key]            BIGINT        NULL,
    [default_bill_to]        NVARCHAR (1)  NULL,
    [default_ship_to]        NVARCHAR (1)  NULL,
    [default_remit_to]       NVARCHAR (1)  NULL,
    [created_timestamp]      DATETIME2 (6) NULL,
    [last_updated_timestamp] DATETIME2 (6) NULL
);


GO

