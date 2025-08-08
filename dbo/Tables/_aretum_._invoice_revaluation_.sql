CREATE TABLE [dbo].["aretum"."invoice_revaluation"] (
    [ar_revaluation_key]           BIGINT          NULL,
    [invoice_key]                  BIGINT          NULL,
    [balance]                      DECIMAL (20, 4) NULL,
    [local_balance]                DECIMAL (20, 4) NULL,
    [local_exchange_rate]          DECIMAL (18, 6) NULL,
    [revalued_local_balance]       DECIMAL (20, 4) NULL,
    [local_fx_gain_loss]           DECIMAL (20, 4) NULL,
    [instance_local_exchange_rate] DECIMAL (18, 6) NULL,
    [instance_fx_gain_loss]        DECIMAL (20, 4) NULL
);


GO

