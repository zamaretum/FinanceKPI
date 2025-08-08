CREATE TABLE [dbo].["aretum"."receiving_document_item"] (
    [receiving_document_item_key] BIGINT          NULL,
    [receiving_document_key]      BIGINT          NULL,
    [po_item_line_descriptor_key] BIGINT          NULL,
    [vendor_invoice_key]          BIGINT          NULL,
    [quantity]                    DECIMAL (15, 6) NULL,
    [comments]                    NVARCHAR (2000) NULL,
    [created_by]                  BIGINT          NULL,
    [created_timestamp]           DATETIME2 (6)   NULL,
    [last_updated_by]             BIGINT          NULL,
    [last_updated_timestamp]      DATETIME2 (6)   NULL
);


GO

