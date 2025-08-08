CREATE TABLE [dbo].["aretum"."invcd_time"] (
    [invoice_key]              BIGINT          NULL,
    [time_data_key]            BIGINT          NULL,
    [writeoff_amount]          DECIMAL (20, 4) NULL,
    [writeoff_quantity]        DECIMAL (15, 2) NULL,
    [writeoff_bill_rate]       DECIMAL (15, 5) NULL,
    [local_writeoff_amount]    DECIMAL (20, 4) NULL,
    [instance_writeoff_amount] DECIMAL (20, 4) NULL
);


GO

