CREATE TABLE [dbo].["aretum"."payment_method"] (
    [payment_method_key]     BIGINT          NULL,
    [payment_method_code]    NVARCHAR (25)   NULL,
    [description]            NVARCHAR (2000) NULL,
    [pr_allowed]             NVARCHAR (1)    NULL,
    [reimbursable]           NVARCHAR (1)    NULL,
    [ap_payment_type]        NVARCHAR (1)    NULL,
    [ar_payment_type]        NVARCHAR (1)    NULL,
    [active]                 NVARCHAR (1)    NULL,
    [allow_for_non_employee] NVARCHAR (1)    NULL,
    [include_in_1099]        NVARCHAR (1)    NULL,
    [use_in_auto_payment]    NVARCHAR (1)    NULL
);


GO

