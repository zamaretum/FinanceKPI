CREATE TABLE [dbo].["aretum"."billing_info"] (
    [vendor_key]         BIGINT         NULL,
    [contact_first_name] NVARCHAR (50)  NULL,
    [contact_last_name]  NVARCHAR (50)  NULL,
    [street1]            NVARCHAR (100) NULL,
    [street2]            NVARCHAR (100) NULL,
    [city]               NVARCHAR (50)  NULL,
    [state]              NVARCHAR (5)   NULL,
    [zip]                NVARCHAR (9)   NULL,
    [account_number]     NVARCHAR (255) NULL,
    [email]              NVARCHAR (100) NULL,
    [phone]              NVARCHAR (25)  NULL,
    [fax]                NVARCHAR (25)  NULL
);


GO

