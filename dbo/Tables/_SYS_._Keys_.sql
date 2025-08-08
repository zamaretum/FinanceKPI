CREATE TABLE [dbo].["SYS"."Keys"] (
    [VDBName]      NVARCHAR (255)  NULL,
    [SchemaName]   NVARCHAR (512)  NULL,
    [TableName]    NVARCHAR (2048) NULL,
    [Name]         NVARCHAR (255)  NULL,
    [Description]  NVARCHAR (255)  NULL,
    [NameInSource] NVARCHAR (255)  NULL,
    [Type]         NVARCHAR (20)   NULL,
    [IsIndexed]    NVARCHAR (5)    NULL,
    [RefKeyUID]    NVARCHAR (50)   NULL,
    [UID]          NVARCHAR (50)   NULL
);


GO

