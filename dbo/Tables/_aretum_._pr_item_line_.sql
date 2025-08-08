CREATE TABLE [dbo].["aretum"."pr_item_line"] (
    [pr_item_line_key]            BIGINT          NULL,
    [pr_item_line_descriptor_key] BIGINT          NULL,
    [pr_key]                      BIGINT          NULL,
    [begin_date]                  DATETIME2 (6)   NULL,
    [end_date]                    DATETIME2 (6)   NULL,
    [required_by_date]            DATETIME2 (6)   NULL,
    [quantity]                    DECIMAL (15, 6) NULL,
    [amount]                      DECIMAL (20, 4) NULL,
    [internal_comments]           NVARCHAR (2000) NULL,
    [external_comments]           NVARCHAR (2000) NULL
);


GO

