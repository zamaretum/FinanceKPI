CREATE TABLE [dbo].["aretum"."export_template_data"] (
    [export_template_data_key] BIGINT          NULL,
    [export_template_key]      BIGINT          NULL,
    [record_type]              DECIMAL (5)     NULL,
    [field_number]             INT             NULL,
    [field_name]               NVARCHAR (60)   NULL,
    [value]                    NVARCHAR (4000) NULL,
    [length]                   INT             NULL,
    [format]                   NVARCHAR (256)  NULL,
    [alignment]                NVARCHAR (10)   NULL,
    [null_value]               NVARCHAR (256)  NULL,
    [notes]                    NVARCHAR (2000) NULL
);


GO

