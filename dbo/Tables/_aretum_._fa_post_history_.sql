CREATE TABLE [dbo].["aretum"."fa_post_history"] (
    [fa_post_history_key]  BIGINT        NULL,
    [post_timestamp]       DATETIME2 (6) NULL,
    [document_number]      NVARCHAR (15) NULL,
    [actuals_through_date] DATETIME2 (6) NULL,
    [post_date]            DATETIME2 (6) NULL,
    [posted_by_key]        BIGINT        NULL,
    [legal_entity_key]     BIGINT        NULL,
    [post_to_gl]           NVARCHAR (1)  NULL,
    [gl_expense_level]     SMALLINT      NULL,
    [gl_accum_level]       SMALLINT      NULL
);


GO

