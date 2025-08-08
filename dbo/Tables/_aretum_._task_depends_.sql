CREATE TABLE [dbo].["aretum"."task_depends"] (
    [predecessor_key] BIGINT       NULL,
    [successor_key]   BIGINT       NULL,
    [type]            NVARCHAR (2) NULL,
    [lag]             DECIMAL (5)  NULL
);


GO

