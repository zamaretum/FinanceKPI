CREATE TABLE [dbo].["aretum"."project_open_access_view"] (
    [project_key]                  BIGINT          NULL,
    [project_manager_open]         VARBINARY (MAX) NULL,
    [project_viewer_open]          VARBINARY (MAX) NULL,
    [resource_planner_open]        VARBINARY (MAX) NULL,
    [resource_requestor_open]      VARBINARY (MAX) NULL,
    [resource_assigner_open]       VARBINARY (MAX) NULL,
    [billing_manager_open]         VARBINARY (MAX) NULL,
    [billing_viewer_open]          VARBINARY (MAX) NULL,
    [project_pr_viewer_open]       VARBINARY (MAX) NULL,
    [project_po_viewer_open]       VARBINARY (MAX) NULL,
    [project_document_viewer_open] VARBINARY (MAX) NULL
);


GO

