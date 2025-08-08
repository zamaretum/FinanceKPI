CREATE TABLE [dbo].["aretum"."person_benefits"] (
    [person_benefits_key] BIGINT          NULL,
    [person_key]          BIGINT          NULL,
    [start_date]          DATETIME2 (6)   NULL,
    [end_date]            DATETIME2 (6)   NULL,
    [amount]              DECIMAL (20, 4) NULL
);


GO

