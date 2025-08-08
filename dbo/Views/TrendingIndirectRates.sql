CREATE VIEW [dbo].[TrendingIndirectRates] AS
SELECT 
    wrE19.[Cost Pool Group] AS "Cost Pool Group",
    wrE19.[Cost Pool] AS "Cost Pool",
    wrE19.[Actual or Budget Name] AS "Actual or Budget Name",
    wrE20.[Fiscal Month] AS "Fiscal Month",
    wrE19.[Fiscal Period] AS "Fiscal Period",
    wrE19.[Current Period Pool Amount] AS "Current Period Pool Amount",
    wrE19.[YTD Pool Amount] AS "YTD Pool Amount",
    wrE19.[Current Period Base Amount] AS "Current Period Base Amount",
    wrE19.[YTD Base Amount] AS "YTD Base Amount",
    wrE20.[Fiscal Month End Date] AS "Fiscal Month End Date",
    wrE20.[Fiscal Year End Date] AS "Fiscal Year End Date",
    wrE19.[Fiscal Month Key] AS "Fiscal Month Key",
    wrE19.[Legal Entity Key] AS "Legal Entity Key",
    wrE19.[Cost Pool Group Key] AS "Cost Pool Group Key",
    wrE19.[Cost Pool Key] AS "Cost Pool Key",
    wrE19.[Display Sequence] AS "Display Sequence"
FROM (
    SELECT 
        x.fiscal_month_key      AS [Fiscal Month Key],
        x.legal_entity_key      AS [Legal Entity Key],
        x.cost_pool_group_key   AS [Cost Pool Group Key],
        x.cost_pool_key         AS [Cost Pool Key],
        x.cost_pool_group_name  AS [Cost Pool Group],
        x.cost_pool             AS [Cost Pool],
        x.actual_or_budget      AS [Actual or Budget Name],
        x.fiscal_period         AS [Fiscal Period],
        x.display_sequence      AS [Display Sequence],
        x.ytd_pool_amount       AS [YTD Pool Amount],
        x.ytd_base_amount       AS [YTD Base Amount],
        x.ytd_rate              AS [YTD Rate],
        x.curr_pool_amount      AS [Current Period Pool Amount],
        x.curr_base_amount      AS [Current Period Base Amount],
        x.curr_rate             AS [Current Period Rate],
        x.[Legal Entity Code],
        x.[Legal Entity Name],
        x.[Cost Pool Group Currency Code]
    FROM (
        SELECT 
            fm.fiscal_month_key             AS fiscal_month_key,
            le.customer_key                 AS legal_entity_key,
            cpg.cost_pool_group_key         AS cost_pool_group_key,
            cp.cost_pool_key                AS cost_pool_key,
            le.customer_code                AS [Legal Entity Code],
            le.customer_name                AS [Legal Entity Name],
            cpg.cost_pool_group_name        AS cost_pool_group_name,
            cp.cost_pool_name               AS cost_pool,
            'Actual'                        AS actual_or_budget,
            CASE 
                WHEN fm.period_number < 10 
                THEN fy.name + '-' + '0' + CAST(fm.period_number AS VARCHAR(4))
                ELSE fy.name + '-' + CAST(fm.period_number AS VARCHAR(4))
            END                             AS fiscal_period,
            cp.display_sequence             AS display_sequence,
            cpsc.amount                     AS ytd_pool_amount,
            cpbc.amount                     AS ytd_base_amount,
            cpc.rate                        AS ytd_rate,
            cpsc_p.amount                   AS prev_pool_amount,
            cpbc_p.amount                   AS prev_base_amount,
            CASE 
                WHEN cpsc_p.amount IS NULL THEN cpsc.amount 
                ELSE cpsc.amount - cpsc_p.amount 
            END                             AS curr_pool_amount,
            CASE 
                WHEN cpbc_p.amount IS NULL THEN cpbc.amount 
                ELSE cpbc.amount - cpbc_p.amount 
            END                             AS curr_base_amount,
            CASE 
                WHEN (cpsc_p.amount IS NULL AND cpbc_p.amount IS NULL) 
                    THEN ROUND(CASE WHEN cpbc.amount = 0 THEN 0 ELSE (100.0 * cpsc.amount / cpbc.amount) END, 6)
                ELSE ROUND(CASE WHEN (cpbc.amount - cpbc_p.amount) = 0 THEN 0 ELSE (100.0 * (cpsc.amount - cpsc_p.amount) / (cpbc.amount - cpbc_p.amount)) END, 6)
            END                             AS curr_rate,
            cc.iso_currency_code            AS [Cost Pool Group Currency Code]
        FROM [dbo].["aretum"."cost_pool_group"] cpg
        JOIN [dbo].["aretum"."currency_code"] cc ON cc.currency_code_key = cpg.currency_code_key
        JOIN [dbo].["aretum"."cost_pool_group_mle"] mle ON mle.cost_pool_group_key = cpg.cost_pool_group_key
        JOIN [dbo].["aretum"."customer"] le ON le.customer_key = mle.legal_entity_key
        JOIN [dbo].["aretum"."cost_pool_group_calc"] cpgc ON cpgc.cost_pool_group_key = cpg.cost_pool_group_key 
            AND cpgc.voided_timestamp IS NULL AND cpgc.voided_by IS NULL
            AND NOT EXISTS (SELECT 1 FROM [dbo].["aretum"."cost_pool_group_calc_budget"] cpgcb WHERE cpgcb.cost_pool_group_calc_key = cpgc.cost_pool_group_calc_key)
        JOIN [dbo].["aretum"."fiscal_month"] fm ON fm.fiscal_month_key = cpgc.post_fiscal_month_key
        JOIN [dbo].["aretum"."fiscal_year"] fy ON fy.fiscal_year_key = fm.fiscal_year_key
        JOIN [dbo].["aretum"."cost_pool"] cp ON cp.cost_pool_group_key = cpgc.cost_pool_group_key 
            AND cp.post_rate_to_cost_struct = 'Y'
        LEFT OUTER JOIN [dbo].["aretum"."cost_pool_calc"] cpc ON cpc.cost_pool_group_calc_key = cpgc.cost_pool_group_calc_key 
            AND cpc.cost_pool_key = cp.cost_pool_key
        LEFT OUTER JOIN (
            SELECT cost_pool_calc_key, SUM(amount) AS amount 
            FROM [dbo].["aretum"."cost_pool_source_calc"]
            GROUP BY cost_pool_calc_key
        ) cpsc ON cpsc.cost_pool_calc_key = cpc.cost_pool_calc_key
        LEFT OUTER JOIN (
            SELECT cost_pool_calc_key, SUM(amount) AS amount
            FROM [dbo].["aretum"."cost_pool_basis_calc"]
            GROUP BY cost_pool_calc_key
        ) cpbc ON cpbc.cost_pool_calc_key = cpc.cost_pool_calc_key
        LEFT OUTER JOIN [dbo].["aretum"."fiscal_month"] fm_p 
            ON fm_p.end_date = DATEADD(DAY, -1, fm.begin_date) 
            AND fm_p.fiscal_year_key = fm.fiscal_year_key
        LEFT OUTER JOIN [dbo].["aretum"."cost_pool_group_calc"] cpgc_p 
            ON cpgc_p.cost_pool_group_key = cpg.cost_pool_group_key 
            AND cpgc_p.post_fiscal_month_key = fm_p.fiscal_month_key 
            AND cpgc_p.voided_timestamp IS NULL AND cpgc_p.voided_by IS NULL 
            AND NOT EXISTS (SELECT 1 FROM [dbo].["aretum"."cost_pool_group_calc_budget"] cpgcb WHERE cpgcb.cost_pool_group_calc_key = cpgc_p.cost_pool_group_calc_key)
        LEFT OUTER JOIN [dbo].["aretum"."cost_pool_calc"] cpc_p ON cpc_p.cost_pool_group_calc_key = cpgc_p.cost_pool_group_calc_key 
            AND cpc_p.cost_pool_key = cp.cost_pool_key
        LEFT OUTER JOIN (
            SELECT cost_pool_calc_key, SUM(amount) AS amount 
            FROM [dbo].["aretum"."cost_pool_source_calc"]
            GROUP BY cost_pool_calc_key
        ) cpsc_p ON cpsc_p.cost_pool_calc_key = cpc_p.cost_pool_calc_key
        LEFT OUTER JOIN (
            SELECT cost_pool_calc_key, SUM(amount) AS amount
            FROM [dbo].["aretum"."cost_pool_basis_calc"]
            GROUP BY cost_pool_calc_key
        ) cpbc_p ON cpbc_p.cost_pool_calc_key = cpc_p.cost_pool_calc_key

        UNION ALL

        SELECT 
            fm.fiscal_month_key             AS fiscal_month_key,
            le.customer_key                 AS legal_entity_key,
            cpg.cost_pool_group_key         AS cost_pool_group_key,
            cp.cost_pool_key                AS cost_pool_key,
            le.customer_code                AS [Legal Entity Code],
            le.customer_name                AS [Legal Entity Name],
            cpg.cost_pool_group_name        AS cost_pool_group_name,
            cp.cost_pool_name               AS cost_pool,
            bn.budget_name                  AS actual_or_budget,
            CASE 
                WHEN fm.period_number < 10 
                THEN fy.name + '-' + '0' + CAST(fm.period_number AS VARCHAR(4))
                ELSE fy.name + '-' + CAST(fm.period_number AS VARCHAR(4))
            END                             AS fiscal_period,
            cp.display_sequence             AS display_sequence,
            cpsc.amount                     AS ytd_pool_amount,
            cpbc.amount                     AS ytd_base_amount,
            cpc.rate                        AS ytd_rate,
            cpsc_p.amount                   AS prev_pool_amount,
            cpbc_p.amount                   AS prev_base_amount,
            CASE 
                WHEN cpsc_p.amount IS NULL THEN cpsc.amount 
                ELSE cpsc.amount - cpsc_p.amount 
            END                             AS curr_pool_amount,
            CASE 
                WHEN cpbc_p.amount IS NULL THEN cpbc.amount 
                ELSE cpbc.amount - cpbc_p.amount 
            END                             AS curr_base_amount,
            CASE 
                WHEN (cpsc_p.amount IS NULL AND cpbc_p.amount IS NULL) 
                    THEN ROUND(CASE WHEN cpbc.amount = 0 THEN 0 ELSE (100.0 * cpsc.amount / cpbc.amount) END, 6)
                ELSE ROUND(CASE WHEN (cpbc.amount - cpbc_p.amount) = 0 THEN 0 ELSE (100.0 * (cpsc.amount - cpsc_p.amount) / (cpbc.amount - cpbc_p.amount)) END, 6)
            END                             AS curr_rate,
            cc.iso_currency_code            AS [Cost Pool Group Currency Code]
        FROM [dbo].["aretum"."cost_pool_group"] cpg
        JOIN [dbo].["aretum"."currency_code"] cc ON cc.currency_code_key = cpg.currency_code_key
        JOIN [dbo].["aretum"."cost_pool_group_calc"] cpgc ON cpgc.cost_pool_group_key = cpg.cost_pool_group_key
            AND cpgc.voided_timestamp IS NULL AND cpgc.voided_by IS NULL
            AND EXISTS (SELECT 1 FROM [dbo].["aretum"."cost_pool_group_calc_budget"] cpgcb WHERE cpgcb.cost_pool_group_calc_key = cpgc.cost_pool_group_calc_key)
        JOIN [dbo].["aretum"."cost_pool"] cp ON cp.cost_pool_group_key = cpgc.cost_pool_group_key
            AND cp.post_rate_to_cost_struct = 'Y'
        LEFT OUTER JOIN [dbo].["aretum"."cost_pool_calc"] cpc ON cpc.cost_pool_group_calc_key = cpgc.cost_pool_group_calc_key
            AND cpc.cost_pool_key = cp.cost_pool_key
        LEFT OUTER JOIN (
            SELECT cost_pool_calc_key, SUM(amount) AS amount
            FROM [dbo].["aretum"."cost_pool_source_calc"]
            GROUP BY cost_pool_calc_key
        ) cpsc ON cpsc.cost_pool_calc_key = cpc.cost_pool_calc_key
        LEFT OUTER JOIN (
            SELECT cost_pool_calc_key, SUM(amount) AS amount
            FROM [dbo].["aretum"."cost_pool_basis_calc"]
            GROUP BY cost_pool_calc_key
        ) cpbc ON cpbc.cost_pool_calc_key = cpc.cost_pool_calc_key
        JOIN [dbo].["aretum"."cost_pool_group_mle"] mle ON mle.cost_pool_group_key = cpg.cost_pool_group_key
        JOIN [dbo].["aretum"."customer"] le ON le.customer_key = mle.legal_entity_key
        JOIN [dbo].["aretum"."fiscal_month"] fm ON fm.fiscal_month_key = cpgc.post_fiscal_month_key
        JOIN [dbo].["aretum"."fiscal_year"] fy ON fy.fiscal_year_key = fm.fiscal_year_key
        JOIN (
            SELECT DISTINCT cb.cost_pool_group_calc_key, b.budget_name_key
            FROM [dbo].["aretum"."cost_pool_group_calc_budget"] cb
            JOIN [dbo].["aretum"."budget"] b ON b.budget_key = cb.budget_key
        ) cpgc_budget ON cpgc_budget.cost_pool_group_calc_key = cpgc.cost_pool_group_calc_key
        JOIN [dbo].["aretum"."budget_name"] bn ON bn.budget_name_key = cpgc_budget.budget_name_key
        LEFT OUTER JOIN [dbo].["aretum"."fiscal_month"] fm_p 
            ON fm_p.end_date = DATEADD(DAY, -1, fm.begin_date) 
            AND fm_p.fiscal_year_key = fm.fiscal_year_key
        LEFT OUTER JOIN [dbo].["aretum"."cost_pool_group_calc"] cpgc_p 
            ON cpgc_p.cost_pool_group_key = cpg.cost_pool_group_key 
            AND cpgc_p.voided_timestamp IS NULL AND cpgc_p.voided_by IS NULL 
            AND cpgc_p.post_fiscal_month_key = fm_p.fiscal_month_key
            AND EXISTS (SELECT 1 FROM [dbo].["aretum"."cost_pool_group_calc_budget"] cpgcb WHERE cpgcb.cost_pool_group_calc_key = cpgc_p.cost_pool_group_calc_key)
        LEFT OUTER JOIN [dbo].["aretum"."cost_pool_calc"] cpc_p ON cpc_p.cost_pool_group_calc_key = cpgc_p.cost_pool_group_calc_key
            AND cpc_p.cost_pool_key = cp.cost_pool_key
        LEFT OUTER JOIN (
            SELECT cost_pool_calc_key, SUM(amount) AS amount
            FROM [dbo].["aretum"."cost_pool_source_calc"]
            GROUP BY cost_pool_calc_key
        ) cpsc_p ON cpsc_p.cost_pool_calc_key = cpc_p.cost_pool_calc_key
        LEFT OUTER JOIN (
            SELECT cost_pool_calc_key, SUM(amount) AS amount
            FROM [dbo].["aretum"."cost_pool_basis_calc"]
            GROUP BY cost_pool_calc_key
        ) cpbc_p ON cpbc_p.cost_pool_calc_key = cpc_p.cost_pool_calc_key
    ) x
    --ORDER BY x.cost_pool_group_name, x.actual_or_budget, x.fiscal_period DESC, x.display_sequence
) wrE19
INNER JOIN (
    SELECT 
        fm.fiscal_month_key     AS [Fiscal Month Key],
        fm.period_number        AS [Fiscal Month],
        fm.begin_date           AS [Fiscal Month Begin Date],
        fm.end_date             AS [Fiscal Month End Date],
        CASE 
            WHEN fm.period_number < 10 
            THEN fy.name + '-' + '0' + CAST(fm.period_number AS VARCHAR(4))
            ELSE fy.name + '-' + CAST(fm.period_number AS VARCHAR(4))
        END                     AS [Fiscal Period],
        CASE 
            WHEN fm.period_number IN (1,2,3) THEN 'Q1'
            WHEN fm.period_number IN (4,5,6) THEN 'Q2'
            WHEN fm.period_number IN (7,8,9) THEN 'Q3'
            WHEN fm.period_number IN (10,11,12) THEN 'Q4'
        END                     AS [Fiscal Quarter],
        fq.begin_date           AS [Fiscal Quarter Begin Date],
        fq.end_date             AS [Fiscal Quarter End Date],
        fy.name                 AS [Fiscal Year],
        fy.begin_date           AS [Fiscal Year Begin Date],
        fy.end_date             AS [Fiscal Year End Date]
    FROM [dbo].["aretum"."fiscal_month"] fm
    JOIN [dbo].["aretum"."fiscal_year"] fy ON fy.fiscal_year_key = fm.fiscal_year_key
    JOIN [dbo].["aretum"."fiscal_quarter"] fq ON fq.fiscal_quarter_key = fm.fiscal_quarter_key  
) wrE20 ON (
    wrE19.[Fiscal Month Key] = wrE20.[Fiscal Month Key]
)
/*
WHERE
    --the varchar to bigint conversion error was coming from this
    wrE19.[Legal Entity Key] = 'Aretum'
*/
/*
WHERE
    --need to select as the number 1, comes ultimately from the customer table, Aretum is both 1 in legal entity key and a Y in legal entity
    --this is already baked into query, so no need to use this where clause either in production, just using for testing purposes
    --"baked in" because cost_pool_group_mle table has only one entry, and it's '1', which when joined against customer, will only pull out aretum
    wrE19.[Legal Entity Key] = 1
*/
/*
ORDER BY
    --order by is a no-no in views (w/o "TOP", which, we're not gonna do here)
    --as far as I know, removing the ordering in the subqueries isn't going to affect the outcome of the joins, so should be good there too
    wrE19.[Cost Pool Group] ASC, wrE19.[Display Sequence] ASC, wrE19.[Cost Pool] ASC, wrE20.[Fiscal Month End Date] DESC
*/