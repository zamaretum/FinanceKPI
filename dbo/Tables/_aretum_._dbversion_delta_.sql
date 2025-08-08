CREATE TABLE [dbo].["aretum"."dbversion_delta"] (
    [delta_key]       BIGINT         NULL,
    [target_version]  NVARCHAR (25)  NULL,
    [sequence_number] NVARCHAR (3)   NULL,
    [path_name]       NVARCHAR (256) NULL,
    [last_updated]    DATETIME2 (6)  NULL,
    [status]          NVARCHAR (1)   NULL,
    [checksum]        BIGINT         NULL
);


GO

