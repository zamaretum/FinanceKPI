CREATE TABLE [dbo].["aretum"."credit_card"] (
    [credit_card_key] BIGINT         NULL,
    [person_key]      BIGINT         NULL,
    [name]            NVARCHAR (128) NULL,
    [vendor]          NVARCHAR (64)  NULL,
    [card_number]     NVARCHAR (32)  NULL,
    [card_type]       NVARCHAR (32)  NULL,
    [exp_date]        NVARCHAR (10)  NULL,
    [display]         NVARCHAR (32)  NULL
);


GO

