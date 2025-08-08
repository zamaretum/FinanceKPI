CREATE TABLE [dbo].["aretum"."address"] (
    [address_key]    BIGINT          NULL,
    [street1]        NVARCHAR (255)  NULL,
    [street2]        NVARCHAR (255)  NULL,
    [street3]        NVARCHAR (2000) NULL,
    [city]           NVARCHAR (60)   NULL,
    [state_province] NVARCHAR (60)   NULL,
    [postal_code]    NVARCHAR (16)   NULL,
    [country]        NVARCHAR (60)   NULL
);


GO

