CREATE TABLE [dbo].["aretum"."fin_document_detail"] (
    [fin_document_detail_key] BIGINT          NULL,
    [fin_document_key]        BIGINT          NULL,
    [account_key]             BIGINT          NULL,
    [organization_key]        BIGINT          NULL,
    [reference]               NVARCHAR (50)   NULL,
    [description]             NVARCHAR (128)  NULL,
    [transaction_date]        DATETIME2 (6)   NULL,
    [person_key]              BIGINT          NULL,
    [general_ledger_key]      BIGINT          NULL,
    [debit_amount]            DECIMAL (20, 4) NULL,
    [credit_amount]           DECIMAL (20, 4) NULL,
    [customer_key]            BIGINT          NULL,
    [detail_type]             NVARCHAR (1)    NULL,
    [local_debit_amount]      DECIMAL (20, 4) NULL,
    [local_credit_amount]     DECIMAL (20, 4) NULL,
    [instance_debit_amount]   DECIMAL (20, 4) NULL,
    [instance_credit_amount]  DECIMAL (20, 4) NULL
);


GO

