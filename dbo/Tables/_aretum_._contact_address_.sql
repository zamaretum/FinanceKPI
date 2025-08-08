CREATE TABLE [dbo].["aretum"."contact_address"] (
    [contact_address_key]      BIGINT        NULL,
    [customer_contact_key]     BIGINT        NULL,
    [address_key]              BIGINT        NULL,
    [contact_address_type_key] BIGINT        NULL,
    [primary_ind]              NVARCHAR (1)  NULL,
    [created_timestamp]        DATETIME2 (6) NULL,
    [last_updated_timestamp]   DATETIME2 (6) NULL
);


GO

