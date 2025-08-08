CREATE TABLE [dbo].["aretum"."po_labor_line"] (
    [po_labor_line_key]            BIGINT          NULL,
    [po_labor_line_descriptor_key] BIGINT          NULL,
    [po_key]                       BIGINT          NULL,
    [begin_date]                   DATETIME2 (6)   NULL,
    [end_date]                     DATETIME2 (6)   NULL,
    [hours]                        DECIMAL (15, 2) NULL,
    [amount]                       DECIMAL (20, 4) NULL,
    [internal_comments]            NVARCHAR (2000) NULL,
    [external_comments]            NVARCHAR (2000) NULL,
    [vi_overage]                   NVARCHAR (1)    NULL
);


GO

