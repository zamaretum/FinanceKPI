CREATE TABLE [dbo].["aretum"."po_item_line"] (
    [po_item_line_key]            BIGINT          NULL,
    [po_item_line_descriptor_key] BIGINT          NULL,
    [po_key]                      BIGINT          NULL,
    [begin_date]                  DATETIME2 (6)   NULL,
    [end_date]                    DATETIME2 (6)   NULL,
    [required_by_date]            DATETIME2 (6)   NULL,
    [quantity]                    DECIMAL (15, 6) NULL,
    [amount]                      DECIMAL (20, 4) NULL,
    [internal_comments]           NVARCHAR (2000) NULL,
    [external_comments]           NVARCHAR (2000) NULL,
    [vi_overage]                  NVARCHAR (1)    NULL,
    [promised_date]               DATETIME2 (6)   NULL,
    [detail_type]                 NVARCHAR (25)   NULL
);


GO

