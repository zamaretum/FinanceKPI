CREATE TABLE [dbo].["aretum"."item"] (
    [item_key]                 BIGINT         NULL,
    [code]                     NVARCHAR (25)  NULL,
    [name]                     NVARCHAR (128) NULL,
    [description]              NVARCHAR (128) NULL,
    [expense_type_key]         BIGINT         NULL,
    [external_code]            NVARCHAR (128) NULL,
    [active]                   NVARCHAR (1)   NULL,
    [bill_by]                  NVARCHAR (1)   NULL,
    [inventory]                NVARCHAR (1)   NULL,
    [manufacturer_part_number] NVARCHAR (50)  NULL,
    [sku]                      NVARCHAR (50)  NULL
);


GO

