CREATE TABLE [dbo].["aretum"."check_print_history"] (
    [check_print_history_key] BIGINT          NULL,
    [printed_by]              BIGINT          NULL,
    [printed_timestamp]       DATETIME2 (6)   NULL,
    [total_amount]            DECIMAL (20, 4) NULL,
    [bank_account_key]        BIGINT          NULL,
    [check_date]              DATETIME2 (6)   NULL,
    [first_check_number]      INT             NULL,
    [last_check_number]       INT             NULL,
    [printed_ind]             NVARCHAR (1)    NULL
);


GO

