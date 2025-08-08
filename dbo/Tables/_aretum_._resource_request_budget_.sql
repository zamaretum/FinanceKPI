CREATE TABLE [dbo].["aretum"."resource_request_budget"] (
    [resource_request_budget_key] BIGINT          NULL,
    [resource_request_key]        BIGINT          NULL,
    [begin_date]                  DATETIME2 (6)   NULL,
    [end_date]                    DATETIME2 (6)   NULL,
    [budget]                      DECIMAL (15, 3) NULL
);


GO

