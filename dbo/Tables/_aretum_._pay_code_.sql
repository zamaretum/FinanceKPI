CREATE TABLE [dbo].["aretum"."pay_code"] (
    [pay_code_key]     BIGINT         NULL,
    [pay_code]         NVARCHAR (10)  NULL,
    [active]           NVARCHAR (1)   NULL,
    [default_list]     NVARCHAR (1)   NULL,
    [default_selected] NVARCHAR (1)   NULL,
    [factor]           DECIMAL (5, 3) NULL,
    [exempt_usage]     NVARCHAR (1)   NULL,
    [description]      NVARCHAR (100) NULL
);


GO

