CREATE TABLE [dbo].["aretum"."prebilled_labor"] (
    [prebilled_labor_key]    BIGINT          NULL,
    [project_key]            BIGINT          NULL,
    [post_history_key]       BIGINT          NULL,
    [invoice_key]            BIGINT          NULL,
    [bill_date]              DATETIME2 (6)   NULL,
    [description]            NVARCHAR (128)  NULL,
    [amount]                 DECIMAL (20, 4) NULL,
    [local_amount]           DECIMAL (20, 4) NULL,
    [local_exchange_rate]    DECIMAL (18, 6) NULL,
    [instance_amount]        DECIMAL (20, 4) NULL,
    [instance_exchange_rate] DECIMAL (18, 6) NULL
);


GO

