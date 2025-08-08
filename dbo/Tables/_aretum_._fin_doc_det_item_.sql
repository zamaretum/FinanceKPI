CREATE TABLE [dbo].["aretum"."fin_doc_det_item"] (
    [fin_document_detail_key]     BIGINT          NULL,
    [item_key]                    BIGINT          NULL,
    [uom_key]                     BIGINT          NULL,
    [quantity]                    DECIMAL (15, 6) NULL,
    [cost_rate]                   DECIMAL (15, 5) NULL,
    [receiving_document_item_key] BIGINT          NULL
);


GO

