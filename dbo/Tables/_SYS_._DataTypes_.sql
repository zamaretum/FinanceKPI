CREATE TABLE [dbo].["SYS"."DataTypes"] (
    [Name]              NVARCHAR (100) NULL,
    [IsStandard]        NVARCHAR (5)   NULL,
    [IsPhysical]        NVARCHAR (5)   NULL,
    [TypeName]          NVARCHAR (100) NULL,
    [JavaClass]         NVARCHAR (500) NULL,
    [Scale]             INT            NULL,
    [TypeLength]        INT            NULL,
    [NullType]          NVARCHAR (20)  NULL,
    [IsSigned]          NVARCHAR (5)   NULL,
    [IsAutoIncremented] NVARCHAR (5)   NULL,
    [IsCaseSensitive]   NVARCHAR (5)   NULL,
    [Precision]         INT            NULL,
    [Radix]             INT            NULL,
    [SearchType]        NVARCHAR (20)  NULL,
    [UID]               NVARCHAR (50)  NULL,
    [RuntimeType]       NVARCHAR (64)  NULL,
    [BaseType]          NVARCHAR (64)  NULL,
    [Description]       NVARCHAR (255) NULL
);


GO

