CREATE TABLE [dbo].["aretum"."project_approval_view"] (
    [project_key]      BIGINT          NULL,
    [leave_request]    VARBINARY (MAX) NULL,
    [time]             VARBINARY (MAX) NULL,
    [expense_request]  VARBINARY (MAX) NULL,
    [expense_report]   VARBINARY (MAX) NULL,
    [purchase_request] VARBINARY (MAX) NULL,
    [purchase_order]   VARBINARY (MAX) NULL,
    [vendor_invoice]   VARBINARY (MAX) NULL
);


GO

