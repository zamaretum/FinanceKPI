CREATE TABLE [dbo].["aretum"."person_time_data_history"] (
    [time_data_key]      BIGINT          NULL,
    [modified_date]      DATETIME2 (6)   NULL,
    [person_time_key]    BIGINT          NULL,
    [project_key]        BIGINT          NULL,
    [task_key]           BIGINT          NULL,
    [work_date]          DATETIME2 (6)   NULL,
    [quantity]           DECIMAL (15, 2) NULL,
    [pay_code_key]       BIGINT          NULL,
    [project_type_key]   BIGINT          NULL,
    [labor_category_key] BIGINT          NULL,
    [location_key]       BIGINT          NULL,
    [comments]           NVARCHAR (2000) NULL,
    [modified_comments]  NVARCHAR (2000) NULL
);


GO

