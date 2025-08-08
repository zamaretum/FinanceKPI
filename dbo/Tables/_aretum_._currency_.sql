CREATE TABLE [dbo].["aretum"."currency"] (
    [currency_key]  BIGINT           NULL,
    [currency_code] NVARCHAR (25)    NULL,
    [description]   NVARCHAR (2000)  NULL,
    [locale]        NVARCHAR (25)    NULL,
    [exchange_rate] DECIMAL (25, 10) NULL
);


GO

