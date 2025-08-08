CREATE TABLE [dbo].["aretum"."cntrct_funded_time"] (
    [allocation_key]    BIGINT          NULL,
    [invoice_key]       BIGINT          NULL,
    [time_data_key]     BIGINT          NULL,
    [amount]            DECIMAL (20, 4) NULL,
    [created_timestamp] DATETIME2 (6)   NULL,
    [project_key]       BIGINT          NULL,
    [task_key]          BIGINT          NULL
);


GO

