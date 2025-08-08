CREATE TABLE [dbo].["aretum"."onetime_charge"] (
    [onetime_charge_key]      BIGINT          NULL,
    [onetime_charge_type_key] BIGINT          NULL,
    [invoice_key]             BIGINT          NULL,
    [project_key]             BIGINT          NULL,
    [task_key]                BIGINT          NULL,
    [description]             NVARCHAR (128)  NULL,
    [amount]                  DECIMAL (20, 4) NULL,
    [local_amount]            DECIMAL (20, 4) NULL,
    [instance_amount]         DECIMAL (20, 4) NULL
);


GO

