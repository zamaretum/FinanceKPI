CREATE TABLE [dbo].["aretum"."account"] (
    [account_key]          BIGINT         NULL,
    [account_code]         NVARCHAR (25)  NULL,
    [description]          NVARCHAR (128) NULL,
    [type]                 NVARCHAR (1)   NULL,
    [active]               NVARCHAR (1)   NULL,
    [entry_allowed]        NVARCHAR (1)   NULL,
    [begin_date]           DATETIME2 (6)  NULL,
    [end_date]             DATETIME2 (6)  NULL,
    [project_required]     NVARCHAR (1)   NULL,
    [hide_income_stmt_hdr] NVARCHAR (1)   NULL,
    [category_1099]        NVARCHAR (5)   NULL
);


GO

