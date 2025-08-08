CREATE TABLE [dbo].["aretum"."deposit_included"] (
    [fin_document_key]               BIGINT          NULL,
    [included_fin_document_key]      BIGINT          NULL,
    [general_ledger_key]             BIGINT          NULL,
    [local_fx_gain]                  DECIMAL (20, 4) NULL,
    [local_fx_loss]                  DECIMAL (20, 4) NULL,
    [local_fx_general_ledger_key]    BIGINT          NULL,
    [instance_fx_gain]               DECIMAL (20, 4) NULL,
    [instance_fx_loss]               DECIMAL (20, 4) NULL,
    [instance_fx_general_ledger_key] BIGINT          NULL
);


GO

