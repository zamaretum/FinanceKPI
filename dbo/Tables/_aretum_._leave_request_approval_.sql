CREATE TABLE [dbo].["aretum"."leave_request_approval"] (
    [leave_request_approval_key] BIGINT          NULL,
    [leave_request_key]          BIGINT          NULL,
    [person_key]                 BIGINT          NULL,
    [alternate_for_key]          BIGINT          NULL,
    [role_key]                   BIGINT          NULL,
    [status]                     NVARCHAR (25)   NULL,
    [status_timestamp]           DATETIME2 (6)   NULL,
    [comments]                   NVARCHAR (2000) NULL
);


GO

