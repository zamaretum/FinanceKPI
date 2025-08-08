CREATE TABLE [dbo].["aretum"."person_time_data_tito"] (
    [time_data_tito_key] BIGINT          NULL,
    [time_data_key]      BIGINT          NULL,
    [start_time]         DATETIME2 (6)   NULL,
    [stop_time]          DATETIME2 (6)   NULL,
    [nonwork_hours]      DECIMAL (4, 2)  NULL,
    [comments]           NVARCHAR (2000) NULL
);


GO

