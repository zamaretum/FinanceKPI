CREATE TABLE [dbo].["aretum"."vendor_payment_1099_view"] (
    [fin_document_key]           BIGINT          NULL,
    [including_fin_document_key] NVARCHAR (MAX)  NULL,
    [included_fin_document_key]  NVARCHAR (MAX)  NULL,
    [dtl_date]                   DATETIME2 (6)   NULL,
    [dtl_reference]              NVARCHAR (MAX)  NULL,
    [eda_key]                    NVARCHAR (MAX)  NULL,
    [account_key]                BIGINT          NULL,
    [type]                       VARBINARY (MAX) NULL,
    [category_1099]              NVARCHAR (MAX)  NULL,
    [included_detail_amount]     NVARCHAR (MAX)  NULL,
    [detail_1099_amount]         NVARCHAR (MAX)  NULL,
    [ptd_key]                    NVARCHAR (MAX)  NULL,
    [fca_key]                    NVARCHAR (MAX)  NULL
);


GO

