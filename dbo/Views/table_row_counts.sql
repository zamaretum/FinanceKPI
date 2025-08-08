CREATE   VIEW [audit].[table_row_counts]
AS
WITH targets AS (
    SELECT Target
    FROM (VALUES
        (N'general_ledger'),
        (N'budget_detail'),
        (N'budget_organization'),
        (N'budget'),
        (N'budget_name'),
        (N'account'),
        (N'customer'),
        (N'member'),
        (N'org_access_person'),
        (N'access_customer_view'),
        (N'currency_code'),
        (N'fiscal_month'),
        (N'fiscal_year'),
        (N'fiscal_quarter'),
        (N'acct_cost_pool_tree'),
        (N'acct_fin_tree'),
        (N'cashflow_account'),
        (N'org_cost_pool_tree'),
        (N'org_fin_tree'),
        (N'org_tree'),
        (N'org_consolidation_tree')
    ) v(Target)
)
SELECT  tgt.Target        AS TableName,
        SUM(ps.row_count) AS [RowCount]
FROM    targets            AS tgt
JOIN    sys.tables         AS t
      ON t.name LIKE N'%' + tgt.Target + N'%'
     AND SCHEMA_NAME(t.schema_id) = N'dbo'          -- 
JOIN    sys.dm_db_partition_stats AS ps
      ON ps.object_id = t.object_id
     AND ps.index_id  IN (0,1)                      
GROUP BY tgt.Target;

