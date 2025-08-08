CREATE TABLE [dbo].["aretum"."po_expense_line"] (
    [po_expense_line_key]            BIGINT          NULL,
    [po_expense_line_descriptor_key] BIGINT          NULL,
    [po_key]                         BIGINT          NULL,
    [begin_date]                     DATETIME2 (6)   NULL,
    [end_date]                       DATETIME2 (6)   NULL,
    [required_by_date]               DATETIME2 (6)   NULL,
    [amount]                         DECIMAL (20, 4) NULL,
    [internal_comments]              NVARCHAR (2000) NULL,
    [external_comments]              NVARCHAR (2000) NULL,
    [vi_overage]                     NVARCHAR (1)    NULL
);


GO

