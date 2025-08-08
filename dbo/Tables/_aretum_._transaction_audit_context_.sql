CREATE TABLE [dbo].["aretum"."transaction_audit_context"] (
    [transaction_audit_context_key] BIGINT        NULL,
    [transaction_id]                NVARCHAR (60) NULL,
    [person_key]                    BIGINT        NULL,
    [category_type]                 NVARCHAR (60) NULL,
    [audit_timestamp]               DATETIME2 (6) NULL
);


GO

