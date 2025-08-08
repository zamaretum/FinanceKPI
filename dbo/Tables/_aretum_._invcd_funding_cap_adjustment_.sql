CREATE TABLE [dbo].["aretum"."invcd_funding_cap_adjustment"] (
    [invoice_key]                BIGINT          NULL,
    [funding_cap_adjustment_key] BIGINT          NULL,
    [writeoff_amount]            DECIMAL (20, 4) NULL,
    [local_writeoff_amount]      DECIMAL (20, 4) NULL,
    [instance_writeoff_amount]   DECIMAL (20, 4) NULL
);


GO

