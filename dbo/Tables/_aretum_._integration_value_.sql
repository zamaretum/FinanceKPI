CREATE TABLE [dbo].["aretum"."integration_value"] (
    [integration_value_key] BIGINT         NULL,
    [integration_key]       BIGINT         NULL,
    [value_type]            NVARCHAR (256) NULL,
    [internal_key]          BIGINT         NULL,
    [external_key]          NVARCHAR (256) NULL,
    [created_by]            BIGINT         NULL,
    [created_timestamp]     DATETIME2 (6)  NULL
);


GO

