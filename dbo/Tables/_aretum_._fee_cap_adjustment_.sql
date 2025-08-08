CREATE TABLE [dbo].["aretum"."fee_cap_adjustment"] (
    [fee_cap_adjustment_key]          BIGINT          NULL,
    [project_key]                     BIGINT          NULL,
    [fee_method_key]                  BIGINT          NULL,
    [post_history_key]                BIGINT          NULL,
    [invoice_key]                     BIGINT          NULL,
    [bill_amount]                     DECIMAL (20, 4) NULL,
    [recognize_amount]                DECIMAL (20, 4) NULL,
    [local_exchange_rate]             DECIMAL (18, 6) NULL,
    [instance_exchange_rate]          DECIMAL (18, 6) NULL,
    [local_bill_amount]               DECIMAL (20, 4) NULL,
    [instance_bill_amount]            DECIMAL (20, 4) NULL,
    [local_recognize_amount]          DECIMAL (20, 4) NULL,
    [instance_recognize_amount]       DECIMAL (20, 4) NULL,
    [local_bill_fx_gain_loss]         DECIMAL (20, 4) NULL,
    [local_recognize_fx_gain_loss]    DECIMAL (20, 4) NULL,
    [instance_bill_fx_gain_loss]      DECIMAL (20, 4) NULL,
    [instance_recognize_fx_gain_loss] DECIMAL (20, 4) NULL
);


GO

