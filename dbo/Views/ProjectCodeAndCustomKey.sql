CREATE OR ALTER VIEW [dbo].[ProjectCodeAndCustomerKey]
AS
WITH
all_fiscal_accounts AS (
    SELECT
        gl.account_key                  AS account_key,
        gl.organization_key             AS org_key,
        fm.fiscal_month_key             AS fiscal_month_key,
        fm.fiscal_year_key              AS fiscal_year_key,
        fm.begin_date                   AS begin_date,
        fm.end_date                     AS end_date,
        CAST(0 AS DECIMAL(38, 6))       AS amount,
        a.type                          AS acc_type,
        gl.transaction_currency         AS transaction_currency,
        gl.local_currency               AS local_currency
    FROM (
        SELECT DISTINCT
            account_key,
            organization_key,
            transaction_currency,
            local_currency
        FROM [dbo].["aretum"."general_ledger"]
    ) gl
    CROSS JOIN [dbo].["aretum"."fiscal_month"] fm
    JOIN [dbo].["aretum"."account"] a
        ON a.account_key = gl.account_key
    WHERE fm.begin_date >= DATEADD(YEAR, -4, CAST(GETDATE() AS date))   -- 3 years back minus 1 extra year
),
re_accounts_cte AS (
    SELECT
        gl.account_key                                  AS account_key,
        gl.organization_key                             AS org_key,
        gl.fiscal_month_key                             AS fiscal_month_key,
        MAX(fm.fiscal_year_key)                         AS fiscal_year_key,
        MAX(fm.begin_date)                              AS begin_date,
        MAX(fm.end_date)                                AS end_date,
        SUM(CASE WHEN a.type = 'E' THEN (gl.debit_amount - gl.credit_amount)
                 WHEN a.type = 'R' THEN (gl.credit_amount - gl.debit_amount)
                 ELSE 0 END)                            AS amount,
        SUM(CASE WHEN a.type = 'E' THEN (gl.local_debit_amount - gl.local_credit_amount)
                 WHEN a.type = 'R' THEN (gl.local_credit_amount - gl.local_debit_amount)
                 ELSE 0 END)                            AS local_amount,
        MAX(gl.transaction_currency)                    AS transaction_currency,
        MAX(gl.local_currency)                          AS local_currency,
        MAX(a.type)                                     AS acc_type
    FROM [dbo].["aretum"."general_ledger"] gl
    JOIN [dbo].["aretum"."fiscal_month"]   fm  ON fm.fiscal_month_key = gl.fiscal_month_key
    JOIN [dbo].["aretum"."account"]        a   ON a.account_key = gl.account_key
    WHERE a.type IN ('E','R')
    GROUP BY gl.account_key, gl.organization_key, gl.fiscal_month_key

    UNION ALL

    SELECT
        afa.account_key,
        afa.org_key,
        afa.fiscal_month_key,
        afa.fiscal_year_key,
        afa.begin_date,
        afa.end_date,
        CAST(0 AS DECIMAL(38, 6))                      AS amount,
        CAST(0 AS DECIMAL(38, 6))                      AS local_amount,
        afa.transaction_currency,
        afa.local_currency,
        afa.acc_type
    FROM all_fiscal_accounts afa
    WHERE afa.acc_type IN ('E','R')
      AND NOT EXISTS (
            SELECT 1
            FROM [dbo].["aretum"."general_ledger"] gl1
            WHERE gl1.account_key = afa.account_key
              AND gl1.organization_key = afa.org_key
              AND gl1.fiscal_month_key = afa.fiscal_month_key
      )
),
totals AS (
    -- A/L running balances by month (carry to next month)
    SELECT
        x.account_key                                AS account_key,
        x.org_key                                    AS org_key,
        x.acc_type                                   AS account_type,
        fm_next.fiscal_month_key                     AS fiscal_month_key,
        x.fiscal_month_key                           AS prev_fiscal_month_key,
        SUM(amount) OVER (PARTITION BY x.account_key, x.org_key ORDER BY x.begin_date)        AS amount,
        SUM(amount) OVER (PARTITION BY x.account_key, x.org_key ORDER BY x.begin_date)        AS amount_c,
        SUM(local_amount) OVER (PARTITION BY x.account_key, x.org_key ORDER BY x.begin_date)  AS local_amount,
        SUM(local_amount) OVER (PARTITION BY x.account_key, x.org_key ORDER BY x.begin_date)  AS local_amount_c,
        x.transaction_currency,
        x.local_currency
    FROM (
        SELECT
            gl.account_key,
            gl.organization_key        AS org_key,
            gl.fiscal_month_key,
            MAX(fm.begin_date)         AS begin_date,
            MAX(fm.end_date)           AS end_date,
            SUM(CASE WHEN a.type = 'A' THEN (gl.debit_amount - gl.credit_amount)
                     WHEN a.type = 'L' THEN (gl.credit_amount - gl.debit_amount)
                     ELSE 0 END)        AS amount,
            SUM(CASE WHEN a.type = 'A' THEN (gl.local_debit_amount - gl.local_credit_amount)
                     WHEN a.type = 'L' THEN (gl.local_credit_amount - gl.local_debit_amount)
                     ELSE 0 END)        AS local_amount,
            MAX(gl.local_currency)     AS local_currency,
            MAX(gl.transaction_currency) AS transaction_currency,
            MAX(a.type)                AS acc_type
        FROM [dbo].["aretum"."general_ledger"] gl
        JOIN [dbo].["aretum"."fiscal_month"]   fm  ON fm.fiscal_month_key = gl.fiscal_month_key
        JOIN [dbo].["aretum"."account"]        a   ON a.account_key = gl.account_key
        WHERE a.type IN ('A','L')
        GROUP BY gl.account_key, gl.organization_key, gl.fiscal_month_key

        UNION ALL

        SELECT
            afa.account_key,
            afa.org_key,
            afa.fiscal_month_key,
            afa.begin_date,
            afa.end_date,
            CAST(0 AS DECIMAL(38, 6)) AS amount,
            CAST(0 AS DECIMAL(38, 6)) AS local_amount,
            afa.local_currency,
            afa.transaction_currency,
            afa.acc_type
        FROM all_fiscal_accounts afa
        WHERE afa.acc_type IN ('A','L')
          AND NOT EXISTS (
                SELECT 1
                FROM [dbo].["aretum"."general_ledger"] gl1
                WHERE gl1.account_key = afa.account_key
                  AND gl1.organization_key = afa.org_key
                  AND gl1.fiscal_month_key = afa.fiscal_month_key
          )
    ) x
    JOIN [dbo].["aretum"."fiscal_month"] fm_next
        ON fm_next.begin_date = DATEADD(day, 1, x.end_date)

    UNION ALL

    -- E/R cumulative within fiscal year, then reset in period 1
    SELECT
        x.account_key,
        x.org_key,
        MAX(x.acc_type)                              AS account_type,
        fm_next.fiscal_month_key                     AS fiscal_month_key,
        x.fiscal_month_key                           AS prev_fiscal_month_key,
        CASE WHEN fm_next.period_number = 1 THEN 0 ELSE SUM(y.amount) END       AS amount,
        SUM(y.amount)                                AS amount_c,
        CASE WHEN fm_next.period_number = 1 THEN 0 ELSE SUM(y.local_amount) END AS local_amount,
        SUM(y.local_amount)                          AS local_amount_c,
        MAX(x.transaction_currency)                  AS transaction_currency,
        MAX(x.local_currency)                        AS local_currency
    FROM re_accounts_cte x
    JOIN re_accounts_cte y
        ON x.account_key = y.account_key
       AND x.org_key    = y.org_key
       AND x.begin_date >= y.begin_date
       AND x.fiscal_year_key = y.fiscal_year_key
    JOIN [dbo].["aretum"."fiscal_month"] fm_next
        ON fm_next.begin_date = DATEADD(day, 1, x.end_date)
    JOIN [dbo].["aretum"."fiscal_year"] fy
        ON fy.fiscal_year_key = fm_next.fiscal_year_key
    GROUP BY
        x.account_key,
        x.org_key,
        fm_next.fiscal_month_key,
        fm_next.period_number,
        x.fiscal_month_key
),
consol_tree_orgs AS (
    SELECT
        c.node_key AS org_key,
        MAX(CASE WHEN p.tree_level = 0 THEN p.node_key ELSE NULL END) AS org_key_0,
        MAX(CASE WHEN p.tree_level = 1 THEN p.node_key ELSE NULL END) AS org_key_1,
        MAX(CASE WHEN p.tree_level = 2 THEN p.node_key ELSE NULL END) AS org_key_2,
        MAX(CASE WHEN p.tree_level = 3 THEN p.node_key ELSE NULL END) AS org_key_3,
        MAX(CASE WHEN p.tree_level = 4 THEN p.node_key ELSE NULL END) AS org_key_4,
        MAX(CASE WHEN p.tree_level = 5 THEN p.node_key ELSE NULL END) AS org_key_5
    FROM [dbo].["aretum"."org_consolidation_tree"] c
    JOIN [dbo].["aretum"."org_consolidation_tree"] p
      ON c.left_visit BETWEEN p.left_visit AND p.right_visit
    GROUP BY c.node_key
),
intercompany_support AS (
    SELECT
        pi.project_key,
        STRING_AGG(org.customer_name, ', ') AS pi_list
    FROM [dbo].["aretum"."project_intercompany"] pi
    LEFT JOIN [dbo].["aretum"."customer"] org
        ON org.customer_key = pi.ic_org
    GROUP BY pi.project_key
)

SELECT
    wrE19."Proj Code"              AS "Proj Code",
    wrE9."CUSTOMER_KEY"            AS "CUSTOMER_KEY",
    wrE9."CUSTOMER_CODE"           AS "CUSTOMER_CODE",
    wrE9."CUSTOMER_NAME"           AS "CUSTOMER_NAME",
    wrE6."Title"                   AS "Title",
    wrE20."Fiscal Year"            AS "Fiscal Year",
    wrE19."General Ledger Key"     AS "General Ledger Key",
    wrE20."Fiscal Month Key"       AS "Fiscal Month Key",
    wrE6."Project Key"             AS "Project Key",
    wrE19."Organization Key"       AS "Organization Key",
    wrE19."Fiscal Month Key"       AS "Fiscal Month Key2",
    wrE19."Project Key"            AS "Project Key2"
FROM
(
    SELECT
        x."General Ledger Key",
        x."Acct Key",
        x."Customer Key",
        x."Organization Key",
        x."Project Key",
        x."Person Key",
        x."Fiscal Month Key",
        x."Acct Code",
        x."Acct Description",
        x."Acct Type",
        x."Acct Type Order",
        x."Credit Amount",
        x."Customer/Vendor Code",
        x."Customer/Vendor Name",
        x."Debit Amount",
        x."GL Description",
        x."Doc Number",
        x."Doc Type",
        x."Doc Type Description",
        x."Doc Key",
        x."Fin Org Code",
        x."Fin Org Name",
        x."Fiscal Period",
        x."Post Date",
        x."Quantity",
        x."Transaction Date",
        x."Legal Entity Org Code",
        x."Legal Entity Org Name",
        x."Person First Name",
        x."Person Last Name",
        x."Person Middle Initial",
        x."Proj Code",
        x."Proj Org Code",
        x."Proj Org Name",
        x."Proj Owning Org Code",
        x."Proj Owning Org Name",
        x."Reference",
        x."BEGINNING_BALANCE",
        x."ENDING_BALANCE",
        x."Transaction Currency Code",
        x."Local Currency Code",
        x."Local Beginning Balance",
        x."Local Credit Amount",
        x."Local Debit Amount",
        x."Local Ending Balance"
    FROM
    (
        -- calculated beginning/ending balances from totals
        SELECT
            NULL                                         AS "General Ledger Key",
            t.account_key                                 AS "Acct Key",
            NULL                                         AS "Customer Key",
            t.org_key                                     AS "Organization Key",
            NULL                                         AS "Project Key",
            NULL                                         AS "Person Key",
            fm_prev.fiscal_month_key                      AS "Fiscal Month Key",
            a.account_code                                AS "Acct Code",
            a.description                                 AS "Acct Description",
            CASE a.type WHEN 'A' THEN 'Asset' WHEN 'E' THEN 'Expense'
                        WHEN 'L' THEN 'Liability' WHEN 'R' THEN 'Revenue'
                        ELSE 'Unknown Account Type' END    AS "Acct Type",
            CASE a.type WHEN 'A' THEN 1 WHEN 'L' THEN 2
                        WHEN 'R' THEN 3 WHEN 'E' THEN 4 END AS "Acct Type Order",
            NULL                                         AS "Credit Amount",
            NULL                                         AS "Customer/Vendor Code",
            NULL                                         AS "Customer/Vendor Name",
            NULL                                         AS "Debit Amount",
            'Calculated Balance'                         AS "GL Description",
            NULL                                         AS "Doc Number",
            NULL                                         AS "Doc Key",
            NULL                                         AS "Doc Type",
            NULL                                         AS "Doc Type Description",
            org.customer_code                             AS "Fin Org Code",
            org.customer_name                             AS "Fin Org Name",
            CASE WHEN fm_prev.period_number < 10
                 THEN CONCAT(CONCAT(CONCAT(fy.name,'-'),'0'), CAST(fm_prev.period_number AS varchar(4)))
                 ELSE CONCAT(CONCAT(fy.name,'-'), CAST(fm_prev.period_number AS varchar(4))) END AS "Fiscal Period",
            NULL                                         AS "Post Date",
            NULL                                         AS "Quantity",
            NULL                                         AS "Transaction Date",
            le.customer_code                              AS "Legal Entity Org Code",
            le.customer_name                              AS "Legal Entity Org Name",
            NULL                                         AS "Person First Name",
            NULL                                         AS "Person Last Name",
            NULL                                         AS "Person Middle Initial",
            NULL                                         AS "Proj Code",
            NULL                                         AS "Proj Org Code",
            NULL                                         AS "Proj Org Name",
            NULL                                         AS "Proj Owning Org Code",
            NULL                                         AS "Proj Owning Org Name",
            NULL                                         AS "Reference",
            t_p.amount                                    AS "BEGINNING_BALANCE",
            t.amount                                      AS "ENDING_BALANCE",
            ccc.iso_currency_code                         AS "Transaction Currency Code",
            lcc.iso_currency_code                         AS "Local Currency Code",
            t_p.local_amount                              AS "Local Beginning Balance",
            NULL                                          AS "Local Credit Amount",
            NULL                                          AS "Local Debit Amount",
            t.local_amount                                AS "Local Ending Balance"
        FROM totals t
        JOIN totals t_p
          ON t.account_key = t_p.account_key
         AND t.org_key = t_p.org_key
         AND t.prev_fiscal_month_key = t_p.fiscal_month_key
        JOIN [dbo].["aretum"."account"] a
          ON a.account_key = t.account_key
        JOIN [dbo].["aretum"."customer"] org
          ON org.customer_key = t.org_key
        JOIN [dbo].["aretum"."fiscal_month"] fm
          ON fm.fiscal_month_key = t.fiscal_month_key
        JOIN [dbo].["aretum"."fiscal_month"] fm_prev
          ON fm_prev.end_date = DATEADD(day, -1, fm.begin_date)
        JOIN [dbo].["aretum"."fiscal_year"]  fy
          ON fy.fiscal_year_key = fm_prev.fiscal_year_key
        LEFT JOIN [dbo].["aretum"."customer"] le
          ON le.customer_key = org.legal_entity_key
        JOIN [dbo].["aretum"."currency_code"] ccc
          ON ccc.currency_code_key = t.transaction_currency
        JOIN [dbo].["aretum"."currency_code"] lcc
          ON lcc.currency_code_key = t.local_currency
        WHERE NOT (t_p.amount = 0 AND t.amount = 0)
          AND fm.begin_date >= DATEADD(YEAR, -3, CAST(GETDATE() AS date))

        UNION ALL

        -- raw GL rows
        SELECT
            gl.general_ledger_key                        AS "General Ledger Key",
            a.account_key                                 AS "Acct Key",
            gl.customer_key                               AS "Customer Key",
            gl.organization_key                           AS "Organization Key",
            gl.project_key                                AS "Project Key",
            gl.person_key                                 AS "Person Key",
            gl.fiscal_month_key                           AS "Fiscal Month Key",
            a.account_code                                AS "Acct Code",
            a.description                                 AS "Acct Description",
            CASE a.type WHEN 'A' THEN 'Asset' WHEN 'E' THEN 'Expense'
                        WHEN 'L' THEN 'Liability' WHEN 'R' THEN 'Revenue'
                        ELSE 'Unknown Account Type' END    AS "Acct Type",
            CASE a.type WHEN 'A' THEN 1 WHEN 'L' THEN 2
                        WHEN 'R' THEN 3 WHEN 'E' THEN 4 END AS "Acct Type Order",
            gl.credit_amount                              AS "Credit Amount",
            cust.customer_code                             AS "Customer/Vendor Code",
            cust.customer_name                             AS "Customer/Vendor Name",
            gl.debit_amount                               AS "Debit Amount",
            gl.description                                AS "GL Description",
            gl.document_number                            AS "Doc Number",
            gl.general_ledger_key                         AS "Doc Key",
            CASE gl.feature
                WHEN 0 THEN 'VI' WHEN 1 THEN 'VP' WHEN 2 THEN 'F2' WHEN 3 THEN 'CP'
                WHEN 4 THEN 'D'  WHEN 5 THEN 'JE' WHEN 6 THEN 'BR' WHEN 7 THEN 'CI'
                WHEN 8 THEN 'LC' WHEN 9 THEN 'EC' WHEN 10 THEN 'FY' WHEN 11 THEN 'AL'
                WHEN 13 THEN 'FA' WHEN 14 THEN 'PILOB' ELSE 'Unknown Document Type' END AS "Doc Type",
            CASE gl.feature
                WHEN 0  THEN 'Vendor Invoice'
                WHEN 1  THEN 'Vendor Payment'
                WHEN 2  THEN 'Unknown Feature 2'
                WHEN 3  THEN 'Customer Payment'
                WHEN 4  THEN 'Deposit'
                WHEN 5  THEN 'Journal Entry'
                WHEN 6  THEN 'Billing and Revenue Post'
                WHEN 7  THEN 'Invoice'
                WHEN 8  THEN 'Labor Cost Post'
                WHEN 9  THEN 'Expense Report Cost Post'
                WHEN 10 THEN 'General Ledger Closing'
                WHEN 11 THEN 'Cost Pool Post'
                WHEN 13 THEN 'Fixed Asset Post'
                WHEN 14 THEN 'Pay in Lieu of Benefits'
                ELSE 'Unknown Document Type' END          AS "Doc Type Description",
            org.customer_code                              AS "Fin Org Code",
            org.customer_name                              AS "Fin Org Name",
            CASE WHEN fm.period_number < 10
                 THEN CONCAT(CONCAT(CONCAT(fy.name,'-'),'0'), CAST(fm.period_number AS varchar(4)))
                 ELSE CONCAT(CONCAT(fy.name,'-'), CAST(fm.period_number AS varchar(4))) END AS "Fiscal Period",
            gl.post_date                                   AS "Post Date",
            gl.quantity                                    AS "Quantity",
            gl.transaction_date                            AS "Transaction Date",
            le.customer_code                               AS "Legal Entity Org Code",
            le.customer_name                               AS "Legal Entity Org Name",
            pers.first_name                                AS "Person First Name",
            pers.last_name                                 AS "Person Last Name",
            pers.middle_initial                            AS "Person Middle Initial",
            proj.project_code                              AS "Proj Code",
            porg.customer_code                             AS "Proj Org Code",
            porg.customer_name                             AS "Proj Org Name",
            pown.customer_code                             AS "Proj Owning Org Code",
            pown.customer_name                             AS "Proj Owning Org Name",
            gl.reference                                   AS "Reference",
            NULL                                           AS "BEGINNING_BALANCE",
            NULL                                           AS "ENDING_BALANCE",
            ccc.iso_currency_code                          AS "Transaction Currency Code",
            lcc.iso_currency_code                          AS "Local Currency Code",
            NULL                                           AS "Local Beginning Balance",
            gl.local_credit_amount                         AS "Local Credit Amount",
            gl.local_debit_amount                          AS "Local Debit Amount",
            NULL                                           AS "Local Ending Balance"
        FROM [dbo].["aretum"."general_ledger"] gl
        JOIN [dbo].["aretum"."account"] a
          ON a.account_key = gl.account_key
        JOIN [dbo].["aretum"."customer"] org
          ON org.customer_key = gl.organization_key
        LEFT JOIN [dbo].["aretum"."customer"]  le
          ON le.customer_key = org.legal_entity_key
        LEFT JOIN [dbo].["aretum"."customer"]  cust
          ON cust.customer_key = gl.customer_key
        JOIN [dbo].["aretum"."fiscal_month"]   fm
          ON fm.fiscal_month_key = gl.fiscal_month_key
        JOIN [dbo].["aretum"."fiscal_year"]    fy
          ON fy.fiscal_year_key = fm.fiscal_year_key
        LEFT JOIN [dbo].["aretum"."project"]   proj
          ON proj.project_key = gl.project_key
        LEFT JOIN [dbo].["aretum"."customer"]  porg
          ON porg.customer_key = proj.customer_key
        LEFT JOIN [dbo].["aretum"."customer"]  pown
          ON pown.customer_key = proj.owning_customer_key
        LEFT JOIN [dbo].["aretum"."person"]    pers
          ON pers.person_key = gl.person_key
        JOIN [dbo].["aretum"."currency_code"]  ccc
          ON ccc.currency_code_key = gl.transaction_currency
        JOIN [dbo].["aretum"."currency_code"]  lcc
          ON lcc.currency_code_key = gl.local_currency
        WHERE fm.begin_date >= DATEADD(YEAR, -3, CAST(GETDATE() AS date))
    ) x
    WHERE
        (EXISTS (SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = 3896 AND role_key = 1))
        OR (EXISTS (SELECT 1 FROM [dbo].["aretum"."org_access_person"] WHERE person_key = 3896 AND role_key = 33 AND global_access = 'Y'))
        OR (
            x."Organization Key" IN (
                SELECT v.customer_key
                FROM [dbo].["aretum"."access_customer_view"] v
                JOIN [dbo].["aretum"."org_access_person"] oap
                  ON oap.org_access_person_key = v.org_access_person_key
                WHERE oap.person_key = 3896
                  AND oap.role_key = 33
                  AND oap.access_type = 2
                  AND v.legal_entity_ind = 'N'
                UNION ALL
                SELECT cust.customer_key
                FROM [dbo].["aretum"."customer"] cust
                WHERE cust.legal_entity_key IN (
                    SELECT v2.customer_key
                    FROM [dbo].["aretum"."access_customer_view"] v2
                    JOIN [dbo].["aretum"."org_access_person"] oap2
                      ON oap2.org_access_person_key = v2.org_access_person_key
                    WHERE oap2.person_key = 3896
                      AND oap2.role_key = 33
                      AND oap2.access_type = 2
                      AND v2.legal_entity_ind = 'Y'
                )
            )
        )
) wrE19
INNER JOIN
(
    SELECT
        c.customer_key                                    AS "CUSTOMER_KEY",
        c.email_1099                                      AS "EMAIL_1099",
        c.vendor_1099                                     AS "VENDOR_1099",
        c.recipient_name_1099                             AS "RECIPIENT_NAME_1099",
        c.federal_tax_id                                  AS "FEDERAL_TAX_ID",
        c.federal_tax_id_type                             AS "FEDERAL_TAX_ID_TYPE",
        c.financial_org                                   AS "FINANCIAL_ORG",
        c.legal_entity                                    AS "LEGAL_ENTITY",
        c.active                                          AS "ACTIVE",
        c.classification                                  AS "CLASSIFICATION",
        c.customer_code                                   AS "CUSTOMER_CODE",
        org_cost_pool_tree1.customer_code                 AS "Org Cost Pool Lv1 Code",
        org_cost_pool_tree1.customer_name                 AS "Org Cost Pool Lv1 Name",
        COALESCE(org_cost_pool_tree2.customer_code, org_cost_pool_tree1.customer_code) AS "Org Cost Pool Lv2 Code",
        COALESCE(org_cost_pool_tree2.customer_name, org_cost_pool_tree1.customer_name) AS "Org Cost Pool Lv2 Name",
        COALESCE(org_cost_pool_tree3.customer_code, org_cost_pool_tree2.customer_code, org_cost_pool_tree1.customer_code) AS "Org Cost Pool Lv3 Code",
        COALESCE(org_cost_pool_tree3.customer_name, org_cost_pool_tree2.customer_name, org_cost_pool_tree1.customer_name) AS "Org Cost Pool Lv3 Name",
        COALESCE(org_cost_pool_tree4.customer_code, org_cost_pool_tree3.customer_code, org_cost_pool_tree2.customer_code, org_cost_pool_tree1.customer_code) AS "Org Cost Pool Lv4 Code",
        COALESCE(org_cost_pool_tree4.customer_name, org_cost_pool_tree3.customer_name, org_cost_pool_tree2.customer_name, org_cost_pool_tree1.customer_name) AS "Org Cost Pool Lv4 Name",
        COALESCE(org_cost_pool_tree5.customer_code, org_cost_pool_tree4.customer_code, org_cost_pool_tree3.customer_code, org_cost_pool_tree2.customer_code, org_cost_pool_tree1.customer_code) AS "Org Cost Pool Lv5 Code",
        COALESCE(org_cost_pool_tree5.customer_name, org_cost_pool_tree4.customer_name, org_cost_pool_tree3.customer_name, org_cost_pool_tree2.customer_name, org_cost_pool_tree1.customer_name) AS "Org Cost Pool Lv5 Name",
        COALESCE(org_cost_pool_tree6.customer_code, org_cost_pool_tree5.customer_code, org_cost_pool_tree4.customer_code, org_cost_pool_tree3.customer_code, org_cost_pool_tree2.customer_code, org_cost_pool_tree1.customer_code) AS "Org Cost Pool Lv6 Code",
        COALESCE(org_cost_pool_tree6.customer_name, org_cost_pool_tree5.customer_name, org_cost_pool_tree4.customer_name, org_cost_pool_tree3.customer_name, org_cost_pool_tree2.customer_name, org_cost_pool_tree1.customer_name) AS "Org Cost Pool Lv6 Name",
        c.entry_allowed                                   AS "ENTRY_ALLOWED",
        c.begin_date                                      AS "BEGIN_DATE",
        c.end_date                                        AS "END_DATE",
        c.account_number                                  AS "ACCOUNT_NUMBER",
        org_fin_tree1.customer_code                       AS "Org Fin Lv1 Code",
        org_fin_tree1.customer_name                       AS "Org Fin Lv1 Name",
        COALESCE(org_fin_tree2.customer_code, org_fin_tree1.customer_code) AS "Org Fin Lv2 Code",
        COALESCE(org_fin_tree2.customer_name, org_fin_tree1.customer_name) AS "Org Fin Lv2 Name",
        COALESCE(org_fin_tree3.customer_code, org_fin_tree2.customer_code, org_fin_tree1.customer_code) AS "Org Fin Lv3 Code",
        COALESCE(org_fin_tree3.customer_name, org_fin_tree2.customer_name, org_fin_tree1.customer_name) AS "Org Fin Lv3 Name",
        COALESCE(org_fin_tree4.customer_code, org_fin_tree3.customer_code, org_fin_tree2.customer_code, org_fin_tree1.customer_code) AS "Org Fin Lv4 Code",
        COALESCE(org_fin_tree4.customer_name, org_fin_tree3.customer_name, org_fin_tree2.customer_name, org_fin_tree1.customer_name) AS "Org Fin Lv4 Name",
        COALESCE(org_fin_tree5.customer_code, org_fin_tree4.customer_code, org_fin_tree3.customer_code, org_fin_tree2.customer_code, org_fin_tree1.customer_code) AS "Org Fin Lv5 Code",
        COALESCE(org_fin_tree5.customer_name, org_fin_tree4.customer_name, org_fin_tree3.customer_name, org_fin_tree2.customer_name, org_fin_tree1.customer_name) AS "Org Fin Lv5 Name",
        COALESCE(org_fin_tree6.customer_code, org_fin_tree5.customer_code, org_fin_tree4.customer_code, org_fin_tree3.customer_code, org_fin_tree2.customer_code, org_fin_tree1.customer_code) AS "Org Fin Lv6 Code",
        COALESCE(org_fin_tree6.customer_name, org_fin_tree5.customer_name, org_fin_tree4.customer_name, org_fin_tree3.customer_name, org_fin_tree2.customer_name, org_fin_tree1.customer_name) AS "Org Fin Lv6 Name",
        c.industry                                        AS "INDUSTRY",
        c.sic_code                                        AS "SIC_CODE",
        c.customer_name                                   AS "CUSTOMER_NAME",
        org_org_tree1.customer_code                       AS "Org Org Lv1 Code",
        org_org_tree1.customer_name                       AS "Org Org Lv1 Name",
        COALESCE(org_org_tree2.customer_code, org_org_tree1.customer_code) AS "Org Org Lv2 Code",
        COALESCE(org_org_tree2.customer_name, org_org_tree1.customer_name) AS "Org Org Lv2 Name",
        COALESCE(org_org_tree3.customer_code, org_org_tree2.customer_code, org_org_tree1.customer_code) AS "Org Org Lv3 Code",
        COALESCE(org_org_tree3.customer_name, org_org_tree2.customer_name, org_org_tree1.customer_name) AS "Org Org Lv3 Name",
        COALESCE(org_org_tree4.customer_code, org_org_tree3.customer_code, org_org_tree2.customer_code, org_org_tree1.customer_code) AS "Org Org Lv4 Code",
        COALESCE(org_org_tree4.customer_name, org_org_tree3.customer_name, org_org_tree2.customer_name, org_org_tree1.customer_name) AS "Org Org Lv4 Name",
        COALESCE(org_org_tree5.customer_code, org_org_tree4.customer_code, org_org_tree3.customer_code, org_org_tree2.customer_code, org_org_tree1.customer_code) AS "Org Org Lv5 Code",
        COALESCE(org_org_tree5.customer_name, org_org_tree4.customer_name, org_org_tree3.customer_name, org_org_tree2.customer_name, org_org_tree1.customer_name) AS "Org Org Lv5 Name",
        COALESCE(org_org_tree6.customer_code, org_org_tree5.customer_code, org_org_tree4.customer_code, org_org_tree3.customer_code, org_org_tree2.customer_code, org_org_tree1.customer_code) AS "Org Org Lv6 Code",
        COALESCE(org_org_tree6.customer_name, org_org_tree5.customer_name, org_org_tree4.customer_name, org_org_tree3.customer_name, org_org_tree2.customer_name, org_org_tree1.customer_name) AS "Org Org Lv6 Name",
        COALESCE(consol_org_tree1.customer_code, le_consol_org_tree1.customer_code) AS "Org Consolidation Lv1 Code",
        COALESCE(consol_org_tree1.customer_name, le_consol_org_tree1.customer_name) AS "Org Consolidation Lv1 Name",
        COALESCE(consol_org_tree2.customer_code, consol_org_tree1.customer_code, le_consol_org_tree2.customer_code, le_consol_org_tree1.customer_code) AS "Org Consolidation Lv2 Code",
        COALESCE(consol_org_tree2.customer_name, consol_org_tree1.customer_name, le_consol_org_tree2.customer_name, le_consol_org_tree1.customer_name) AS "Org Consolidation Lv2 Name",
        COALESCE(consol_org_tree3.customer_code, consol_org_tree2.customer_code, consol_org_tree1.customer_code, le_consol_org_tree3.customer_code, le_consol_org_tree2.customer_code, le_consol_org_tree1.customer_code) AS "Org Consolidation Lv3 Code",
        COALESCE(consol_org_tree3.customer_name, consol_org_tree2.customer_name, consol_org_tree1.customer_name, le_consol_org_tree3.customer_name, le_consol_org_tree2.customer_name, le_consol_org_tree1.customer_name) AS "Org Consolidation Lv3 Name",
        COALESCE(consol_org_tree4.customer_code, consol_org_tree3.customer_code, consol_org_tree2.customer_code, consol_org_tree1.customer_code, le_consol_org_tree4.customer_code, le_consol_org_tree3.customer_code, le_consol_org_tree2.customer_code, le_consol_org_tree1.customer_code) AS "Org Consolidation Lv4 Code",
        COALESCE(consol_org_tree4.customer_name, consol_org_tree3.customer_name, consol_org_tree2.customer_name, consol_org_tree1.customer_name, le_consol_org_tree4.customer_name, le_consol_org_tree3.customer_name, le_consol_org_tree2.customer_name, le_consol_org_tree1.customer_name) AS "Org Consolidation Lv4 Name",
        COALESCE(consol_org_tree5.customer_code, consol_org_tree4.customer_code, consol_org_tree3.customer_code, consol_org_tree2.customer_code, consol_org_tree1.customer_code, le_consol_org_tree5.customer_code, le_consol_org_tree4.customer_code, le_consol_org_tree3.customer_code, le_consol_org_tree2.customer_code, le_consol_org_tree1.customer_code) AS "Org Consolidation Lv5 Code",
        COALESCE(consol_org_tree5.customer_name, consol_org_tree4.customer_name, consol_org_tree3.customer_name, consol_org_tree2.customer_name, consol_org_tree1.customer_name, le_consol_org_tree5.customer_name, le_consol_org_tree4.customer_name, le_consol_org_tree3.customer_name, le_consol_org_tree2.customer_name, le_consol_org_tree1.customer_name) AS "Org Consolidation Lv5 Name",
        COALESCE(consol_org_tree6.customer_code, consol_org_tree5.customer_code, consol_org_tree4.customer_code, consol_org_tree3.customer_code, consol_org_tree2.customer_code, consol_org_tree1.customer_code, le_consol_org_tree6.customer_code, le_consol_org_tree5.customer_code, le_consol_org_tree4.customer_code, le_consol_org_tree3.customer_code, le_consol_org_tree2.customer_code, le_consol_org_tree1.customer_code) AS "Org Consolidation Lv6 Code",
        COALESCE(consol_org_tree6.customer_name, consol_org_tree5.customer_name, consol_org_tree4.customer_name, consol_org_tree3.customer_name, consol_org_tree2.customer_name, consol_org_tree1.customer_name, le_consol_org_tree6.customer_name, le_consol_org_tree5.customer_name, le_consol_org_tree4.customer_name, le_consol_org_tree3.customer_name, le_consol_org_tree2.customer_name, le_consol_org_tree1.customer_name) AS "Org Consolidation Lv6 Name",
        c.sector                                          AS "SECTOR",
        c.customer_size                                   AS "CUSTOMER_SIZE",
        c.stock_symbol                                    AS "STOCK_SYMBOL",
        ct.customer_type                                  AS "CUSTOMER_TYPE",
        c.user01                                          AS "Org User01",
        c.user02                                          AS "Org User02",
        c.user03                                          AS "Org User03",
        c.user04                                          AS "Org User04",
        c.user05                                          AS "Org User05",
        c.user06                                          AS "Org User06",
        c.user07                                          AS "Org User07",
        c.user08                                          AS "Org User08",
        c.user09                                          AS "Org User09",
        c.user10                                          AS "Org User10",
        c.user11                                          AS "Org User11",
        c.user12                                          AS "Org User12",
        c.user13                                          AS "Org User13",
        c.user14                                          AS "Org User14",
        c.user15                                          AS "Org User15",
        c.user16                                          AS "Org User16",
        c.user17                                          AS "Org User17",
        c.user18                                          AS "Org User18",
        c.user19                                          AS "Org User19",
        c.user20                                          AS "Org User20",
        cgl.customer_code                                 AS "LE Default Post Org",
        cle.customer_code                                 AS "Org's Legal Entity Code",
        c.transact_elimination_flag                       AS "Elimination Org Indicator"
    FROM [dbo].["aretum"."customer"] c
    LEFT JOIN [dbo].["aretum"."customer_type"]  ct   ON ct.customer_type_key = c.customer_type_key
    LEFT JOIN [dbo].["aretum"."customer"]       cgl  ON cgl.customer_key = c.default_gl_post_org_key
    LEFT JOIN [dbo].["aretum"."customer"]       cle  ON cle.customer_key = c.legal_entity_key
    LEFT JOIN (
        SELECT
            c.node_key AS org_key,
            MAX(CASE WHEN p.tree_level = 0 THEN p.node_key ELSE NULL END) AS org_key_0,
            MAX(CASE WHEN p.tree_level = 1 THEN p.node_key ELSE NULL END) AS org_key_1,
            MAX(CASE WHEN p.tree_level = 2 THEN p.node_key ELSE NULL END) AS org_key_2,
            MAX(CASE WHEN p.tree_level = 3 THEN p.node_key ELSE NULL END) AS org_key_3,
            MAX(CASE WHEN p.tree_level = 4 THEN p.node_key ELSE NULL END) AS org_key_4,
            MAX(CASE WHEN p.tree_level = 5 THEN p.node_key ELSE NULL END) AS org_key_5
        FROM [dbo].["aretum"."org_cost_pool_tree"] c
        JOIN [dbo].["aretum"."org_cost_pool_tree"] p
          ON c.left_visit BETWEEN p.left_visit AND p.right_visit
        GROUP BY c.node_key
    ) org_cost_pool_tree_orgs
      ON org_cost_pool_tree_orgs.org_key = c.customer_key
    LEFT JOIN [dbo].["aretum"."customer"] org_cost_pool_tree1 ON org_cost_pool_tree1.customer_key = org_cost_pool_tree_orgs.org_key_0
    LEFT JOIN [dbo].["aretum"."customer"] org_cost_pool_tree2 ON org_cost_pool_tree2.customer_key = org_cost_pool_tree_orgs.org_key_1
    LEFT JOIN [dbo].["aretum"."customer"] org_cost_pool_tree3 ON org_cost_pool_tree3.customer_key = org_cost_pool_tree_orgs.org_key_2
    LEFT JOIN [dbo].["aretum"."customer"] org_cost_pool_tree4 ON org_cost_pool_tree4.customer_key = org_cost_pool_tree_orgs.org_key_3
    LEFT JOIN [dbo].["aretum"."customer"] org_cost_pool_tree5 ON org_cost_pool_tree5.customer_key = org_cost_pool_tree_orgs.org_key_4
    LEFT JOIN [dbo].["aretum"."customer"] org_cost_pool_tree6 ON org_cost_pool_tree6.customer_key = org_cost_pool_tree_orgs.org_key_5
    LEFT JOIN (
        SELECT
            c.node_key AS org_key,
            MAX(CASE WHEN p.tree_level = 0 THEN p.node_key ELSE NULL END) AS org_key_0,
            MAX(CASE WHEN p.tree_level = 1 THEN p.node_key ELSE NULL END) AS org_key_1,
            MAX(CASE WHEN p.tree_level = 2 THEN p.node_key ELSE NULL END) AS org_key_2,
            MAX(CASE WHEN p.tree_level = 3 THEN p.node_key ELSE NULL END) AS org_key_3,
            MAX(CASE WHEN p.tree_level = 4 THEN p.node_key ELSE NULL END) AS org_key_4,
            MAX(CASE WHEN p.tree_level = 5 THEN p.node_key ELSE NULL END) AS org_key_5
        FROM [dbo].["aretum"."org_fin_tree"] c
        JOIN [dbo].["aretum"."org_fin_tree"] p
          ON c.left_visit BETWEEN p.left_visit AND p.right_visit
        GROUP BY c.node_key
    ) org_fin_tree_orgs
      ON org_fin_tree_orgs.org_key = c.customer_key
    LEFT JOIN [dbo].["aretum"."customer"] org_fin_tree1 ON org_fin_tree1.customer_key = org_fin_tree_orgs.org_key_0
    LEFT JOIN [dbo].["aretum"."customer"] org_fin_tree2 ON org_fin_tree2.customer_key = org_fin_tree_orgs.org_key_1
    LEFT JOIN [dbo].["aretum"."customer"] org_fin_tree3 ON org_fin_tree3.customer_key = org_fin_tree_orgs.org_key_2
    LEFT JOIN [dbo].["aretum"."customer"] org_fin_tree4 ON org_fin_tree4.customer_key = org_fin_tree_orgs.org_key_3
    LEFT JOIN [dbo].["aretum"."customer"] org_fin_tree5 ON org_fin_tree5.customer_key = org_fin_tree_orgs.org_key_4
    LEFT JOIN [dbo].["aretum"."customer"] org_fin_tree6 ON org_fin_tree6.customer_key = org_fin_tree_orgs.org_key_5
    LEFT JOIN (
        SELECT
            c.node_key AS org_key,
            MAX(CASE WHEN p.tree_level = 0 THEN p.node_key ELSE NULL END) AS org_key_0,
            MAX(CASE WHEN p.tree_level = 1 THEN p.node_key ELSE NULL END) AS org_key_1,
            MAX(CASE WHEN p.tree_level = 2 THEN p.node_key ELSE NULL END) AS org_key_2,
            MAX(CASE WHEN p.tree_level = 3 THEN p.node_key ELSE NULL END) AS org_key_3,
            MAX(CASE WHEN p.tree_level = 4 THEN p.node_key ELSE NULL END) AS org_key_4,
            MAX(CASE WHEN p.tree_level = 5 THEN p.node_key ELSE NULL END) AS org_key_5
        FROM [dbo].["aretum"."org_tree"] c
        JOIN [dbo].["aretum"."org_tree"] p
          ON c.left_visit BETWEEN p.left_visit AND p.right_visit
        GROUP BY c.node_key
    ) org_org_tree_orgs
      ON org_org_tree_orgs.org_key = c.customer_key
    LEFT JOIN [dbo].["aretum"."customer"] org_org_tree1 ON org_org_tree1.customer_key = org_org_tree_orgs.org_key_0
    LEFT JOIN [dbo].["aretum"."customer"] org_org_tree2 ON org_org_tree2.customer_key = org_org_tree_orgs.org_key_1
    LEFT JOIN [dbo].["aretum"."customer"] org_org_tree3 ON org_org_tree3.customer_key = org_org_tree_orgs.org_key_2
    LEFT JOIN [dbo].["aretum"."customer"] org_org_tree4 ON org_org_tree4.customer_key = org_org_tree_orgs.org_key_3
    LEFT JOIN [dbo].["aretum"."customer"] org_org_tree5 ON org_org_tree5.customer_key = org_org_tree_orgs.org_key_4
    LEFT JOIN [dbo].["aretum"."customer"] org_org_tree6 ON org_org_tree6.customer_key = org_org_tree_orgs.org_key_5
    LEFT JOIN consol_tree_orgs le_consol_tree_orgs
      ON le_consol_tree_orgs.org_key = cle.customer_key
    LEFT JOIN [dbo].["aretum"."customer"] le_consol_org_tree1 ON le_consol_org_tree1.customer_key = le_consol_tree_orgs.org_key_0
    LEFT JOIN [dbo].["aretum"."customer"] le_consol_org_tree2 ON le_consol_org_tree2.customer_key = le_consol_tree_orgs.org_key_1
    LEFT JOIN [dbo].["aretum"."customer"] le_consol_org_tree3 ON le_consol_org_tree3.customer_key = le_consol_tree_orgs.org_key_2
    LEFT JOIN [dbo].["aretum"."customer"] le_consol_org_tree4 ON le_consol_org_tree4.customer_key = le_consol_tree_orgs.org_key_3
    LEFT JOIN [dbo].["aretum"."customer"] le_consol_org_tree5 ON le_consol_org_tree5.customer_key = le_consol_tree_orgs.org_key_4
    LEFT JOIN [dbo].["aretum"."customer"] le_consol_org_tree6 ON le_consol_org_tree6.customer_key = le_consol_tree_orgs.org_key_5
    LEFT JOIN consol_tree_orgs org_consol_tree_orgs
      ON org_consol_tree_orgs.org_key = c.customer_key
    LEFT JOIN [dbo].["aretum"."customer"] consol_org_tree1 ON consol_org_tree1.customer_key = org_consol_tree_orgs.org_key_0
    LEFT JOIN [dbo].["aretum"."customer"] consol_org_tree2 ON consol_org_tree2.customer_key = org_consol_tree_orgs.org_key_1
    LEFT JOIN [dbo].["aretum"."customer"] consol_org_tree3 ON consol_org_tree3.customer_key = org_consol_tree_orgs.org_key_2
    LEFT JOIN [dbo].["aretum"."customer"] consol_org_tree4 ON consol_org_tree4.customer_key = org_consol_tree_orgs.org_key_3
    LEFT JOIN [dbo].["aretum"."customer"] consol_org_tree5 ON consol_org_tree5.customer_key = org_consol_tree_orgs.org_key_4
    LEFT JOIN [dbo].["aretum"."customer"] consol_org_tree6 ON consol_org_tree6.customer_key = org_consol_tree_orgs.org_key_5
    WHERE c.customer_key IS NOT NULL
) wrE9
    ON wrE19."Organization Key" = wrE9."CUSTOMER_KEY"

INNER JOIN
(
    SELECT
        fm.fiscal_month_key     AS "Fiscal Month Key",
        fm.period_number        AS "Fiscal Month",
        fm.begin_date           AS "Fiscal Month Begin Date",
        fm.end_date             AS "Fiscal Month End Date",
        CASE WHEN fm.period_number < 10
             THEN CONCAT(CONCAT(CONCAT(fy.name,'-'),'0'), CAST(fm.period_number AS varchar(4)))
             ELSE CONCAT(CONCAT(fy.name,'-'), CAST(fm.period_number AS varchar(4))) END AS "Fiscal Period",
        CASE WHEN fm.period_number IN (1,2,3) THEN 'Q1'
             WHEN fm.period_number IN (4,5,6) THEN 'Q2'
             WHEN fm.period_number IN (7,8,9) THEN 'Q3'
             WHEN fm.period_number IN (10,11,12) THEN 'Q4' END AS "Fiscal Quarter",
        fq.begin_date           AS "Fiscal Quarter Begin Date",
        fq.end_date             AS "Fiscal Quarter End Date",
        fy.name                 AS "Fiscal Year",
        fy.begin_date           AS "Fiscal Year Begin Date",
        fy.end_date             AS "Fiscal Year End Date"
    FROM [dbo].["aretum"."fiscal_month"] fm
    JOIN [dbo].["aretum"."fiscal_year"]    fy ON fy.fiscal_year_key = fm.fiscal_year_key
    JOIN [dbo].["aretum"."fiscal_quarter"] fq ON fq.fiscal_quarter_key = fm.fiscal_quarter_key
) wrE20
    ON wrE19."Fiscal Month Key" = wrE20."Fiscal Month Key"

LEFT OUTER JOIN
(
    SELECT
        proj.project_key                         AS "Project Key",
        proj.customer_key                        AS "Customer Key",
        proj.owning_customer_key                 AS "Owning Cust Key",
        pra.billing_manager_open                 AS "Billing Mgr Open",
        pra.billing_viewer_open                  AS "Billing Viewer Open",
        pra.project_po_viewer_open               AS "Proj PO Viewer Open",
        pra.project_pr_viewer_open               AS "Proj PR Viewer Open",
        pra.project_document_viewer_open         AS "Proj Doc Viewer Open",
        pra.project_manager_open                 AS "Proj Mgr Open",
        pra.project_viewer_open                  AS "Proj Viewer Open",
        pra.resource_assigner_open               AS "Res Assigner Open",
        pra.resource_planner_open                AS "Res Planner Open",
        pra.resource_requestor_open              AS "Res Requestor Open",
        proj.expense_assignment_flag             AS "Expense Assign Flag",
        proj.future_charge                       AS "Future Charge",
        proj.item_assignment_flag                AS "Item Assign Flag",
        proj.time_assignment_flag                AS "Time Assign Flag",
        CASE proj.bill_rate_source WHEN 'P' THEN 'P - Person Bill Rate'
                                   WHEN 'L' THEN 'L - Labor Category Bill Rate' END AS "Proj Bill Rate Source",
        bt.code                                  AS "Proj Billing Type Code",
        CASE WHEN EXISTS(SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = 3896 AND role_key IN (1,21,37,39)) THEN proj.Exp_Bill_Budget ELSE NULL END AS "Proj Budget Exp Bill Amt",
        CASE WHEN EXISTS(SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = 3896 AND role_key IN (1,21,38,40)) THEN proj.exp_cost_burden_budget ELSE NULL END AS "Proj Budget Exp Burdened Cost",
        CASE WHEN EXISTS(SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = 3896 AND role_key IN (1,21,38,40)) THEN proj.exp_cost_budget ELSE NULL END AS "Proj Budget Exp Cost Amt",
        proj.hours_budget                        AS "Proj Budget Hours",
        CASE WHEN EXISTS(SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = 3896 AND role_key IN (1,21,37,39)) THEN proj.labor_bill_budget ELSE NULL END AS "Proj Budget Lab Bill Amt",
        CASE WHEN EXISTS(SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = 3896 AND role_key IN (1,21,38,40)) THEN proj.labor_cost_burden_budget ELSE NULL END AS "Proj Budget Lab Burd Cost",
        CASE WHEN EXISTS(SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = 3896 AND role_key IN (1,21,38,40)) THEN proj.Labor_Cost_Budget ELSE NULL END AS "Proj Budget Lab Cost Amt",
        proj.project_code                        AS "Project Code",
        proj.purpose                             AS "Purpose",
        proj.completed_date                      AS "Completed Date",
        proj.project_color                       AS "Project Color",
        CASE proj.cost_rate_source WHEN 'P' THEN 'P - Person Cost Rate'
                                   WHEN 'L' THEN 'L - Labor Category Cost Rate' END AS "Proj Cost Rate Source",
        cs.cost_structure                        AS "Cost Structure",
        loc.location_name                        AS "Location",
        pc.pay_code                              AS "Pay Code",
        proj.leave_balance                       AS "Leave Balance",
        proj.Enforce_Wbs_Dates                   AS "Enforce Wbs Dates",
        CASE WHEN EXISTS(SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = 3896 AND role_key IN (1,21,37,39)) THEN proj.exp_bill_est_tot ELSE NULL END AS "Proj Est Tot Exp Bill Amt",
        CASE WHEN EXISTS(SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = 3896 AND role_key IN (1,21,38,40)) THEN proj.exp_cost_est_tot ELSE NULL END AS "Proj Est Tot Exp Cost Amt",
        proj.hours_est_tot                       AS "Proj Est Total",
        CASE WHEN EXISTS(SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = 3896 AND role_key IN (1,21,37,39)) THEN proj.labor_bill_est_tot ELSE NULL END AS "Proj Est Tot Lab Bill Amt",
        CASE WHEN EXISTS(SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = 3896 AND role_key IN (1,21,38,40)) THEN proj.labor_cost_est_tot ELSE NULL END AS "Proj Est Tot Lab Cost Amt",
        CASE WHEN EXISTS(SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = 3896 AND role_key IN (1,21,37,39)) THEN proj.Exp_Bill_Etc ELSE NULL END AS "Proj ETC Exp Bill Amt",
        CASE WHEN EXISTS(SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = 3896 AND role_key IN (1,21,38,40)) THEN proj.exp_cost_etc ELSE NULL END AS "Proj ETC Exp Cost Amt",
        proj.hours_etc                           AS "Proj ETC Hours",
        CASE WHEN EXISTS(SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = 3896 AND role_key IN (1,21,37,39)) THEN proj.labor_bill_etc ELSE NULL END AS "Proj ETC Lab Bill Amt",
        CASE WHEN EXISTS(SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = 3896 AND role_key IN (1,21,38,40)) THEN proj.labor_cost_etc ELSE NULL END AS "Proj ETC Labor Cost Amount",
        proj.er_task_required                    AS "ER Task Reqd",
        proj.Account_Number                      AS "Account Number",
        COALESCE(proj.funded_value, proj.orig_funded_value) AS "Funded Value",
        proj.item_task_required                  AS "Item Task Reqd",
        cle.customer_code                        AS "Proj Legal Entity Code",
        cle.customer_name                        AS "Proj Legal Entity Name",
        proj.limit_bill_to_funded                AS "Proj Limit Bill to Funded",
        proj.limit_rev_to_funded                 AS "Proj Limit Rev to Funded",
        proj.location_required                   AS "Location Reqd",
        proj.task_level_assignment               AS "Task Level Assignment",
        perm.last_name                           AS "Proj Manager Last Name",
        perm.first_name                          AS "Proj Manager First Name",
        perm.middle_initial                      AS "Proj Manager Middle Initial",
        perm.username                            AS "Proj Manager Username",
        perm.email                               AS "Proj Manager Email",
        perl.last_name                           AS "Proj Lead Last Name",
        perl.first_name                          AS "Proj Lead First Name",
        perl.middle_initial                      AS "Proj Lead Middle Initial",
        perl.username                            AS "Proj Lead Username",
        perl.email                               AS "Proj Lead Email",
        perv.last_name                           AS "Proj Viewer Last Name",
        perv.first_name                          AS "Proj Viewer First Name",
        perv.middle_initial                      AS "Proj Viewer Middle Initial",
        perv.username                            AS "Proj Viewer Username",
        perv.email                               AS "Proj Viewer Email",
        c.customer_code                          AS "Proj Org Code",
        c.customer_name                          AS "Proj Org Name",
        proj.orig_end_date                       AS "Original End Date",
        proj.orig_start_date                     AS "Original Start Date",
        coo.customer_code                        AS "Proj Owning Org Code",
        coo.customer_name                        AS "Proj Owning Org Name",
        proj.percent_complete                    AS "Percent Complete",
        proj.pct_complete_rule                   AS "Percent Complete Rule",
        proj.exp_sub_po_required                 AS "Exp Sub PO Reqd",
        proj.ts_sub_po_required                  AS "Ts Sub PO Reqd",
        pg.posting_group_name                    AS "Posting Group Name",
        proj.probability_percent                 AS "Probability Percent",
        proj.use_labor_category                  AS "Use Labor Category",
        proj.proj_require_time_comments          AS "Proj Require Time Comments",
        proj.rev_end_date                        AS "Rev End Date",
        proj.rev_start_date                      AS "Rev Start Date",
        proj.self_assign_plans                   AS "Self Assign Plans",
        proj.allow_self_plan                     AS "Allow Self Plan",
        proj.assignment_flag                     AS "Assignment Flag",
        ps.status                                AS "Status",
        proj.ts_task_required                    AS "Ts Task Reqd",
        proj.title                               AS "Title",
        proj.tito_required                       AS "Tito Reqd",
        COALESCE(proj.total_value, proj.orig_total_value) AS "Total Value",
        pt.project_type                          AS "Project Type",
        proj.user01                              AS "Proj UDF 01",
        proj.user02                              AS "Proj UDF 02",
        proj.user03                              AS "Proj UDF 03",
        proj.user04                              AS "Proj UDF 04",
        proj.user05                              AS "Proj UDF 05",
        proj.user06                              AS "Proj UDF 06",
        proj.user07                              AS "Proj UDF 07",
        proj.user08                              AS "Proj UDF 08",
        proj.user09                              AS "Proj UDF 09",
        proj.user10                              AS "Proj UDF 10",
        proj.user11                              AS "Proj UDF 11",
        proj.user12                              AS "Proj UDF 12",
        proj.user13                              AS "Proj UDF 13",
        proj.user14                              AS "Proj UDF 14",
        proj.user15                              AS "Proj UDF 15",
        proj.user16                              AS "Proj UDF 16",
        proj.user17                              AS "Proj UDF 17",
        proj.user18                              AS "Proj UDF 18",
        proj.user19                              AS "Proj UDF 19",
        proj.user20                              AS "Proj UDF 20",
        proj.orig_total_value                    AS "Total Value - Original",
        proj.orig_funded_value                   AS "Funded Value - Original",
        cn.contract_code                         AS "Contract Code",
        cn.contract_key                          AS "Contract Key",
        cn.contract_title                        AS "Contract Title",
        COALESCE(mcn.contract_code,  cn.contract_code)  AS "Master Contract Code",
        COALESCE(mcn.contract_title, cn.contract_title) AS "Master Contract Title",
        COALESCE(proj.total_cost, proj.orig_total_cost) AS "Total Cost - Current",
        proj.orig_total_cost                     AS "Total Cost - Original",
        COALESCE(proj.total_fee, proj.orig_total_fee)   AS "Total Fee - Current",
        proj.orig_total_fee                      AS "Total Fee - Original",
        COALESCE(proj.funded_cost, proj.orig_funded_cost) AS "Funded Cost - Current",
        proj.orig_funded_cost                    AS "Funded Cost - Original",
        COALESCE(proj.funded_fee, proj.orig_funded_fee)   AS "Funded Fee - Current",
        proj.orig_funded_fee                     AS "Funded Fee - Original",
        CASE WHEN i_s.project_key IS NULL THEN 'N' ELSE 'Y' END AS "Intercompany Effort",
        i_s.pi_list                              AS "Intercompany Support",
        CASE WHEN ce.code IS NOT NULL THEN CONCAT(cs.cost_structure,'-', ce.code) ELSE NULL END AS "Default Labor Cost Element",
        proj.created                             AS "Project Created Date",
        fm.fee_method                            AS "Project Fee Method",
        pf.fee_factor                            AS "Project Fee Factor",
        pf.fee_factor_type                       AS "Project Fee Factor Type",
        pf.fixed_fee_amount                      AS "Fixed Fee Amount",
        proj.advanced_costing_flag               AS "Advanced Costing Yes or No",
        ooc.iso_currency_code                    AS "Project Owning Org Currency Code"
    FROM [dbo].["aretum"."project"] proj
    JOIN [dbo].["aretum"."customer"] c   ON c.customer_key = proj.customer_key
    LEFT JOIN [dbo].["aretum"."customer"]        coo ON coo.customer_key = proj.owning_customer_key
    LEFT JOIN [dbo].["aretum"."customer_type"]   ctp ON ctp.customer_type_key = c.customer_type_key
    LEFT JOIN [dbo].["aretum"."billing_type"]    bt  ON bt.billing_type_key = proj.billing_type_key
    LEFT JOIN [dbo].["aretum"."cost_struct"]     cs  ON cs.cost_struct_key = proj.cost_struct_key
    LEFT JOIN [dbo].["aretum"."location"]        loc ON loc.location_key = proj.location_key
    LEFT JOIN [dbo].["aretum"."pay_code"]        pc  ON pc.pay_code_key = proj.pay_code_key
    LEFT JOIN [dbo].["aretum"."project_open_access_view"] pra ON pra.project_key = proj.project_key
    LEFT JOIN [dbo].["aretum"."project_controller"]          pcm ON pcm.project_key = proj.project_key AND pcm.role_key = 3  AND pcm.primary_ind = 'Y'
    LEFT JOIN [dbo].["aretum"."project_controller"]          pcl ON pcl.project_key = proj.project_key AND pcl.role_key = 12 AND pcl.primary_ind = 'Y'
    LEFT JOIN [dbo].["aretum"."project_controller"]          pcv ON pcv.project_key = proj.project_key AND pcv.role_key = 14 AND pcv.primary_ind = 'Y'
    LEFT JOIN [dbo].["aretum"."posting_group"]           pg      ON pg.posting_group_key = proj.posting_group_key
    JOIN [dbo].["aretum"."project_status"]          ps      ON ps.project_status_key = proj.project_status_key
    JOIN [dbo].["aretum"."project_type"]            pt      ON pt.project_type_key = proj.project_type_key
    LEFT JOIN [dbo].["aretum"."person"]       perm    ON perm.person_key = pcm.person_key
    LEFT JOIN [dbo].["aretum"."person"]       perl    ON perl.person_key = pcl.person_key
    LEFT JOIN [dbo].["aretum"."person"]       perv    ON perv.person_key = pcv.person_key
    LEFT JOIN [dbo].["aretum"."org_tree"]     ot      ON ot.node_key = proj.customer_key
    LEFT JOIN [dbo].["aretum"."customer"]     col     ON col.customer_key = coo.legal_entity_key
    LEFT JOIN [dbo].["aretum"."customer"]     cle     ON cle.customer_key = col.customer_key
    LEFT JOIN [dbo].["aretum"."contract"]     cn      ON cn.contract_key = proj.contract_key
    LEFT JOIN [dbo].["aretum"."contract"]     mcn     ON cn.prime_contract_key = mcn.contract_key
    LEFT JOIN intercompany_support i_s ON i_s.project_key = proj.project_key
    LEFT JOIN [dbo].["aretum"."cost_struct_labor"]  csl ON csl.cost_struct_labor_key = proj.ic_cost_struct_labor_key
    LEFT JOIN [dbo].["aretum"."cost_element"]       ce  ON ce.cost_element_key = csl.cost_element_key
    LEFT JOIN [dbo].["aretum"."project_fee"]           pf
           ON pf.project_key = proj.project_key
          AND pf.fee_method_key IN (
                SELECT TOP (1) pfi.fee_method_key
                FROM [dbo].["aretum"."project_fee"] pfi
                INNER JOIN [dbo].["aretum"."fee_method"] fmi
                    ON fmi.fee_method_key = pfi.fee_method_key
                   AND pfi.project_key  = proj.project_key
                ORDER BY fmi.fee_method ASC
          )
    LEFT JOIN [dbo].["aretum"."fee_method"] fm ON fm.fee_method_key = pf.fee_method_key
    LEFT JOIN [dbo].["aretum"."currency_code"] ooc ON ooc.currency_code_key = coo.currency_code_key
    WHERE
        (EXISTS (SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = 3896 AND role_key IN (1,21)))
        OR EXISTS (
            SELECT 1
            FROM [dbo].["aretum"."project_controller"] pc
            WHERE pc.project_key = proj.project_key
              AND pc.person_key = 3896
              AND pc.role_key IN (3, 14, 19, 20, 15, 18, 17)
        )
        OR EXISTS (
            SELECT 1
            FROM [dbo].["aretum"."project_controller"] pc
            JOIN [dbo].["aretum"."alternate"] a
              ON a.person_key = pc.person_key
             AND a.role_key = pc.role_key
            WHERE pc.project_key = proj.project_key
              AND pc.primary_ind = 'Y'
              AND a.alternate_key = 3896
              AND pc.role_key IN (3, 14, 19, 20, 15, 18, 17)
        )
        OR (
            EXISTS (
                SELECT pra.project_key
                FROM [dbo].["aretum"."project_open_access_view"] pra
                WHERE pra.billing_viewer_open = 'Y'
                  AND pra.project_key = proj.project_key
            )
            AND (
                EXISTS (
                    SELECT 1
                    FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = 3896
                      AND oap.access_type = 1
                      AND oap.role_key = 20
                )
                OR proj.customer_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = 3896
                      AND oap.access_type = 1
                      AND oap.role_key = 20
                )
            )
            AND (
                EXISTS (
                    SELECT 1
                    FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = 3896
                      AND oap.access_type = 4
                      AND oap.role_key = 20
                )
                OR proj.owning_customer_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = 3896
                      AND oap.access_type = 4
                      AND oap.role_key = 20
                )
            )
        )
        OR (
            EXISTS (
                SELECT pra.project_key
                FROM [dbo].["aretum"."project_open_access_view"] pra
                WHERE pra.billing_manager_open = 'Y'
                  AND pra.project_key = proj.project_key
            )
            AND (
                EXISTS (
                    SELECT 1
                    FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = 3896
                      AND oap.access_type = 1
                      AND oap.role_key = 19
                )
                OR proj.customer_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = 3896
                      AND oap.access_type = 1
                      AND oap.role_key = 19
                )
            )
            AND (
                EXISTS (
                    SELECT 1
                    FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = 3896
                      AND oap.access_type = 4
                      AND oap.role_key = 19
                )
                OR proj.owning_customer_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = 3896
                      AND oap.access_type = 4
                      AND oap.role_key = 19
                )
            )
        )
        OR (
            EXISTS (
                SELECT pra.project_key
                FROM [dbo].["aretum"."project_open_access_view"] pra
                WHERE pra.project_viewer_open = 'Y'
                  AND pra.project_key = proj.project_key
            )
            AND (
                EXISTS (
                    SELECT 1
                    FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = 3896
                      AND oap.access_type = 1
                      AND oap.role_key = 14
                )
                OR proj.customer_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = 3896
                      AND oap.access_type = 1
                      AND oap.role_key = 14
                )
            )
            AND (
                EXISTS (
                    SELECT 1
                    FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = 3896
                      AND oap.access_type = 4
                      AND oap.role_key = 14
                )
                OR proj.owning_customer_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = 3896
                      AND oap.access_type = 4
                      AND oap.role_key = 14
                )
            )
        )
        OR (
            EXISTS (
                SELECT pra.project_key
                FROM [dbo].["aretum"."project_open_access_view"] pra
                WHERE pra.project_manager_open = 'Y'
                  AND pra.project_key = proj.project_key
            )
            AND (
                EXISTS (
                    SELECT 1
                    FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = 3896
                      AND oap.access_type = 1
                      AND oap.role_key = 3
                )
                OR proj.customer_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = 3896
                      AND oap.access_type = 1
                      AND oap.role_key = 3
                )
            )
            AND (
                EXISTS (
                    SELECT 1
                    FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = 3896
                      AND oap.access_type = 4
                      AND oap.role_key = 3
                )
                OR proj.owning_customer_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = 3896
                      AND oap.access_type = 4
                      AND oap.role_key = 3
                )
            )
        )
        OR (
            EXISTS (
                SELECT pra.project_key
                FROM [dbo].["aretum"."project_open_access_view"] pra
                WHERE pra.resource_planner_open = 'Y'
                  AND pra.project_key = proj.project_key
            )
            AND (
                EXISTS (
                    SELECT 1
                    FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = 3896
                      AND oap.access_type = 1
                      AND oap.role_key = 15
                )
                OR proj.customer_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = 3896
                      AND oap.access_type = 1
                      AND oap.role_key = 15
                )
            )
            AND (
                EXISTS (
                    SELECT 1
                    FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = 3896
                      AND oap.access_type = 4
                      AND oap.role_key = 15
                )
                OR proj.owning_customer_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = 3896
                      AND oap.access_type = 4
                      AND oap.role_key = 15
                )
            )
        )
        OR (
            EXISTS (
                SELECT pra.project_key
                FROM [dbo].["aretum"."project_open_access_view"] pra
                WHERE pra.resource_assigner_open = 'Y'
                  AND pra.project_key = proj.project_key
            )
            AND (
                EXISTS (
                    SELECT 1
                    FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = 3896
                      AND oap.access_type = 1
                      AND oap.role_key = 18
                )
                OR proj.customer_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = 3896
                      AND oap.access_type = 1
                      AND oap.role_key = 18
                )
            )
            AND (
                EXISTS (
                    SELECT 1
                    FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = 3896
                      AND oap.access_type = 4
                      AND oap.role_key = 18
                )
                OR proj.owning_customer_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = 3896
                      AND oap.access_type = 4
                      AND oap.role_key = 18
                )
            )
        )
        OR (
            EXISTS (
                SELECT pra.project_key
                FROM [dbo].["aretum"."project_open_access_view"] pra
                WHERE pra.resource_requestor_open = 'Y'
                  AND pra.project_key = proj.project_key
            )
            AND (
                EXISTS (
                    SELECT 1
                    FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = 3896
                      AND oap.access_type = 1
                      AND oap.role_key = 17
                )
                OR proj.customer_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = 3896
                      AND oap.access_type = 1
                      AND oap.role_key = 17
                )
            )
            AND (
                EXISTS (
                    SELECT 1
                    FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = 3896
                      AND oap.access_type = 4
                      AND oap.role_key = 17
                )
                OR proj.owning_customer_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = 3896
                      AND oap.access_type = 4
                      AND oap.role_key = 17
                )
            )
        )
        OR EXISTS (
            SELECT 1
            FROM [dbo].["aretum"."project_controller"] pc
            WHERE pc.project_key = proj.project_key
              AND pc.person_key = 3896
              AND pc.role_key IN (12, 13)
        )
        OR EXISTS (
            SELECT 1
            FROM [dbo].["aretum"."project_controller"] pc
            JOIN [dbo].["aretum"."alternate"] a
              ON a.person_key = pc.person_key
             AND a.role_key = pc.role_key
            WHERE pc.project_key = proj.project_key
              AND pc.primary_ind = 'Y'
              AND a.alternate_key = 3896
              AND pc.role_key IN (12, 13)
        )
) wrE6
    ON wrE19."Project Key" = wrE6."Project Key";
GO
