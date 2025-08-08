CREATE TABLE [dbo].["aretum"."bank_account"] (
    [bank_account_key]       BIGINT        NULL,
    [name]                   NVARCHAR (25) NULL,
    [type]                   NVARCHAR (1)  NULL,
    [bank_name]              NVARCHAR (50) NULL,
    [bank_account_number]    NVARCHAR (30) NULL,
    [bank_routing_number]    NVARCHAR (9)  NULL,
    [account_key]            BIGINT        NULL,
    [customer_key]           BIGINT        NULL,
    [checking_account]       NVARCHAR (1)  NULL,
    [last_check_number_used] INT           NULL,
    [attachment_key]         BIGINT        NULL,
    [active]                 NVARCHAR (1)  NULL,
    [currency]               BIGINT        NULL
);


GO

