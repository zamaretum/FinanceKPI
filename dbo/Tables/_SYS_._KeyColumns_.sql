CREATE TABLE [dbo].["SYS"."KeyColumns"] (
    [VDBName]    NVARCHAR (255)  NULL,
    [SchemaName] NVARCHAR (512)  NULL,
    [TableName]  NVARCHAR (2048) NULL,
    [Name]       NVARCHAR (255)  NULL,
    [KeyName]    NVARCHAR (255)  NULL,
    [KeyType]    NVARCHAR (20)   NULL,
    [RefKeyUID]  NVARCHAR (50)   NULL,
    [UID]        NVARCHAR (50)   NULL,
    [Position]   INT             NULL,
    [TableUID]   NVARCHAR (50)   NULL
);


GO

