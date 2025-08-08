CREATE TABLE [dbo].["aretum"."change_reason"] (
    [change_reason_key]  BIGINT          NULL,
    [change_reason_code] NVARCHAR (50)   NULL,
    [description]        NVARCHAR (2000) NULL,
    [active]             NVARCHAR (1)    NULL,
    [audit_trail]        NVARCHAR (1)    NULL,
    [adjustment]         NVARCHAR (1)    NULL
);


GO

