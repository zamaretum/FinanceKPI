CREATE TABLE [dbo].["aretum"."export_template"] (
    [export_template_key] BIGINT          NULL,
    [name]                NVARCHAR (128)  NULL,
    [owner_key]           BIGINT          NULL,
    [created]             DATETIME2 (6)   NULL,
    [last_updated]        DATETIME2 (6)   NULL,
    [file_type]           NVARCHAR (25)   NULL,
    [template_type]       NVARCHAR (25)   NULL,
    [editable]            NVARCHAR (1)    NULL,
    [import_ind]          NVARCHAR (1)    NULL,
    [default_filename]    NVARCHAR (250)  NULL,
    [default_email]       NVARCHAR (250)  NULL,
    [user_email]          NVARCHAR (1)    NULL,
    [description]         NVARCHAR (2000) NULL,
    [order_by_list]       NVARCHAR (4000) NULL,
    [payroll_export_flag] NVARCHAR (1)    NULL
);


GO

