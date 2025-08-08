CREATE TABLE [dbo].["aretum"."resource_request_history"] (
    [resource_request_history_key] BIGINT          NULL,
    [resource_request_key]         BIGINT          NULL,
    [person_key]                   BIGINT          NULL,
    [alternate_for_key]            BIGINT          NULL,
    [role_key]                     BIGINT          NULL,
    [status]                       NVARCHAR (25)   NULL,
    [status_date]                  DATETIME2 (6)   NULL,
    [comments]                     NVARCHAR (2000) NULL
);


GO

