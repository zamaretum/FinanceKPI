CREATE TABLE [dbo].["aretum"."vi_sect_fmt"] (
    [vi_sect_fmt_key]           BIGINT        NULL,
    [vendor_invoice_format_key] BIGINT        NULL,
    [type]                      SMALLINT      NULL,
    [label]                     NVARCHAR (50) NULL,
    [sequence]                  SMALLINT      NULL,
    [show_amount]               NVARCHAR (1)  NULL,
    [show_date]                 NVARCHAR (1)  NULL,
    [show_hours]                NVARCHAR (1)  NULL,
    [show_rate]                 NVARCHAR (1)  NULL,
    [show_section_tot_amount]   NVARCHAR (1)  NULL,
    [show_section_tot_qty]      NVARCHAR (1)  NULL,
    [col1_field]                SMALLINT      NULL,
    [col1_heading]              NVARCHAR (40) NULL,
    [col1_subtotal_amount]      NVARCHAR (1)  NULL,
    [col1_subtotal_qty]         NVARCHAR (1)  NULL,
    [col2_field]                SMALLINT      NULL,
    [col2_heading]              NVARCHAR (40) NULL,
    [col2_subtotal_amount]      NVARCHAR (1)  NULL,
    [col2_subtotal_qty]         NVARCHAR (1)  NULL,
    [col3_field]                SMALLINT      NULL,
    [col3_heading]              NVARCHAR (40) NULL,
    [col3_subtotal_amount]      NVARCHAR (1)  NULL,
    [col3_subtotal_qty]         NVARCHAR (1)  NULL,
    [col4_field]                SMALLINT      NULL,
    [col4_heading]              NVARCHAR (40) NULL,
    [col4_subtotal_amount]      NVARCHAR (1)  NULL,
    [col4_subtotal_qty]         NVARCHAR (1)  NULL
);


GO

