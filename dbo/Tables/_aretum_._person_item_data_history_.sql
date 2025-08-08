CREATE TABLE [dbo].["aretum"."person_item_data_history"] (
    [item_data_key]     BIGINT          NULL,
    [modified_date]     DATETIME2 (6)   NULL,
    [person_time_key]   BIGINT          NULL,
    [project_key]       BIGINT          NULL,
    [task_key]          BIGINT          NULL,
    [item_key]          BIGINT          NULL,
    [uom_key]           BIGINT          NULL,
    [location_key]      BIGINT          NULL,
    [project_type_key]  BIGINT          NULL,
    [reference]         NVARCHAR (25)   NULL,
    [work_date]         DATETIME2 (6)   NULL,
    [quantity]          DECIMAL (15, 6) NULL,
    [comments]          NVARCHAR (2000) NULL,
    [modified_comments] NVARCHAR (2000) NULL
);


GO

