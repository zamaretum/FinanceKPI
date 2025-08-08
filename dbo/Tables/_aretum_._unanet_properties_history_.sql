CREATE TABLE [dbo].["aretum"."unanet_properties_history"] (
    [updated_timestamp]  DATETIME2 (6)   NULL,
    [updater_key]        BIGINT          NULL,
    [property_name]      NVARCHAR (200)  NULL,
    [property_old_value] NVARCHAR (4000) NULL,
    [property_new_value] NVARCHAR (4000) NULL
);


GO

