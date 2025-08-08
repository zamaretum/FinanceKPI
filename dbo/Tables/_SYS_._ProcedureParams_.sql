CREATE TABLE [dbo].["SYS"."ProcedureParams"] (
    [VDBName]       NVARCHAR (255)  NULL,
    [SchemaName]    NVARCHAR (512)  NULL,
    [ProcedureName] NVARCHAR (1024) NULL,
    [Name]          NVARCHAR (255)  NULL,
    [DataType]      NVARCHAR (25)   NULL,
    [Position]      INT             NULL,
    [Type]          NVARCHAR (100)  NULL,
    [Optional]      NVARCHAR (5)    NULL,
    [Precision]     INT             NULL,
    [TypeLength]    INT             NULL,
    [Scale]         INT             NULL,
    [Radix]         INT             NULL,
    [NullType]      NVARCHAR (10)   NULL,
    [UID]           NVARCHAR (50)   NULL,
    [Description]   NVARCHAR (255)  NULL
);


GO

