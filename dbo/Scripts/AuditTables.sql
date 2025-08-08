

CREATE SCHEMA audit;   
GO


/* row‑per‑night snapshot table  */
CREATE TABLE audit.nightly_table_row_counts
(
    RunTS                    datetime2(3)  NOT NULL  PRIMARY KEY,   -- snapshot timestamp
    [general_ledger]         bigint        NOT NULL,
    [budget_detail]          bigint        NOT NULL,
    [budget_organization]    bigint        NOT NULL,
    [budget]                 bigint        NOT NULL,
    [budget_name]            bigint        NOT NULL,
    [account]                bigint        NOT NULL,
    [customer]               bigint        NOT NULL,
    [member]                 bigint        NOT NULL,
    [org_access_person]      bigint        NOT NULL,
    [access_customer_view]   bigint        NOT NULL,
    [currency_code]          bigint        NOT NULL,
    [fiscal_month]           bigint        NOT NULL,
    [fiscal_year]            bigint        NOT NULL,
    [fiscal_quarter]         bigint        NOT NULL,
    [acct_cost_pool_tree]    bigint        NOT NULL,
    [acct_fin_tree]          bigint        NOT NULL,
    [cashflow_account]       bigint        NOT NULL,
    [org_cost_pool_tree]     bigint        NOT NULL,
    [org_fin_tree]           bigint        NOT NULL,
    [org_tree]               bigint        NOT NULL,
    [org_consolidation_tree] bigint        NOT NULL,
    [cost_pool_source_calc]  bigint        NOT NULL,
    [cost_pool_basis_calc]  bigint        NOT NULL,
    [cost_pool_group_calc_budget]  bigint        NOT NULL, 
    [cost_pool_calc]  bigint        NOT NULL,
    [cost_pool_group_calc]  bigint        NOT NULL,
    [fiscal_quarter]  bigint        NOT NULL,
    [fiscal_year]  bigint        NOT NULL,
    [cost_pool]  bigint        NOT NULL,
    [cost_pool_group_mle]  bigint        NOT NULL,
    [cost_pool_group]  bigint        NOT NULL,
    RecordedBy               varchar(128)  NULL  DEFAULT (SYSTEM_USER)
);


---Script useed on pipeline post execute------
INSERT INTO audit.nightly_table_row_counts
(
    RunTS,
    [general_ledger],
    [budget_detail],
    [budget_organization],
    [budget],
    [budget_name],
    [account],
    [customer],
    [member],
    [org_access_person],
    [access_customer_view],
    [currency_code],
    [fiscal_month],
    [fiscal_year],
    [fiscal_quarter],
    [acct_cost_pool_tree],
    [acct_fin_tree],
    [cashflow_account],
    [org_cost_pool_tree],
    [org_fin_tree],
    [org_tree],
    [org_consolidation_tree],
    RecordedBy
)
SELECT
    SYSDATETIME()                                       AS RunTS,
    MAX(CASE WHEN TableName = 'general_ledger'          THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'budget_detail'           THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'budget_organization'     THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'budget'                  THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'budget_name'             THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'account'                 THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'customer'                THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'member'                  THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'org_access_person'       THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'access_customer_view'    THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'currency_code'           THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'fiscal_month'            THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'fiscal_year'             THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'fiscal_quarter'          THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'acct_cost_pool_tree'     THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'acct_fin_tree'           THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'cashflow_account'        THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'org_cost_pool_tree'      THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'org_fin_tree'            THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'org_tree'                THEN [RowCount] END),
    MAX(CASE WHEN TableName = 'org_consolidation_tree'  THEN [RowCount] END),
    SYSTEM_USER                                         AS RecordedBy
FROM audit.table_row_counts;
