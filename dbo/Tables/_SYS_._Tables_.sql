CREATE TABLE [dbo].["SYS"."Tables"] (
    [VDBName]         NVARCHAR (255)  NULL,
    [SchemaName]      NVARCHAR (512)  NULL,
    [Name]            NVARCHAR (1024) NULL,
    [Type]            NVARCHAR (20)   NULL,
    [NameInSource]    NVARCHAR (2048) NULL,
    [IsPhysical]      NVARCHAR (5)    NULL,
    [SupportsUpdates] NVARCHAR (5)    NULL,
    [UID]             NVARCHAR (50)   NULL,
    [Cardinality]     BIGINT          NULL,
    [Description]     NVARCHAR (255)  NULL,
    [IsSystem]        NVARCHAR (5)    NULL,
    [IsMaterialized]  NVARCHAR (5)    NULL,
    [SchemaUID]       NVARCHAR (50)   NULL
);


GO

