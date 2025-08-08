CREATE TABLE [dbo].["aretum"."invoice_number"] (
    [invoice_number_key] BIGINT        NULL,
    [name]               NVARCHAR (50) NULL,
    [prefix]             NVARCHAR (25) NULL,
    [min_width]          DECIMAL (2)   NULL,
    [start_with]         DECIMAL (5)   NULL,
    [last_number]        BIGINT        NULL,
    [default_selected]   NVARCHAR (1)  NULL,
    [active]             NVARCHAR (1)  NULL
);


GO

