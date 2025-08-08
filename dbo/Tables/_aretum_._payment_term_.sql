CREATE TABLE [dbo].["aretum"."payment_term"] (
    [payment_term_key]  BIGINT         NULL,
    [payment_term_code] NVARCHAR (25)  NULL,
    [description]       NVARCHAR (128) NULL,
    [days]              DECIMAL (3)    NULL,
    [default_selected]  NVARCHAR (1)   NULL,
    [active]            NVARCHAR (1)   NULL,
    [discount_days]     DECIMAL (3)    NULL,
    [discount_percent]  DECIMAL (5, 2) NULL,
    [pay_when_paid]     NVARCHAR (1)   NULL
);


GO

