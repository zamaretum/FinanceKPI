CREATE VIEW [dbo].[AdvancedBookings]
AS
WITH sub_totals AS (
    SELECT
        c.contract_key,
        SUM(COALESCE(sub_p.total_value, 0))  AS total_value,
        SUM(COALESCE(sub_p.total_cost, 0))   AS total_cost,
        SUM(COALESCE(sub_p.total_fee, 0))    AS total_fee,
        SUM(COALESCE(sub_p.funded_value, 0)) AS funded_value,
        SUM(COALESCE(sub_p.funded_cost, 0))  AS funded_cost,
        SUM(COALESCE(sub_p.funded_fee, 0))   AS funded_fee
    FROM [dbo].["aretum"."contract"] c
    LEFT OUTER JOIN [dbo].["aretum"."contract"] sub_c
        ON sub_c.prime_contract_key = c.contract_key
    LEFT OUTER JOIN [dbo].["aretum"."project"] sub_p
        ON sub_p.contract_key = sub_c.contract_key
    GROUP BY c.contract_key
),
contract_types AS (
    SELECT
        cta.contract_key,
        STRING_AGG(ct.contract_type, ',') AS contract_types
    FROM [dbo].["aretum"."contract_type_assignment"] cta
    JOIN [dbo].["aretum"."contract_type"] ct
        ON cta.contract_type_key = ct.contract_type_key
    GROUP BY cta.contract_key
),
c_se_status AS (
    SELECT
        css1.contract_key,
        STRING_AGG(ss.name, ',') AS socioeconomic_status
    FROM [dbo].["aretum"."contract_socioeconomic_status"] css1
    JOIN [dbo].["aretum"."socioeconomic_status"] ss
        ON ss.socioeconomic_status_key = css1.socioeconomic_status_key
    GROUP BY css1.contract_key
),
c_ind AS (
    SELECT
        ci1.contract_key,
        STRING_AGG(i.name, ',') AS industry_names
    FROM [dbo].["aretum"."contract_industry"] ci1
    JOIN [dbo].["aretum"."industry"] i
        ON i.industry_key = ci1.industry_key
    GROUP BY ci1.contract_key
),
main_q AS (
    SELECT
        c.contract_key                                      AS "Contract Key",
        MAX(c.contract_code)                                AS "Contract Code",
        MAX(c.contract_title)                               AS "Contract Title",
        MAX(cs.status)                                      AS "Contract Status",
        MAX(c.ceiling_amount)                               AS "Ceiling Amount",
        MAX(m.first_name)                                   AS "Contract Manager First Name",
        MAX(m.last_name)                                    AS "Contract Manager Last Name",
        MAX(m.middle_initial)                               AS "Contract Manager Middle Initial",
        MAX(m.username)                                     AS "Contract Manager Username",
        MAX(oo.customer_code)                               AS "Owning Org Code",
        MAX(oo.customer_name)                               AS "Owning Org Name",
        MAX(cust.customer_code)                             AS "Customer Org Code",
        MAX(cust.customer_name)                             AS "Customer Org Name",
        MAX(cust_c.first_name)                              AS "Contract Officer First Name",
        MAX(cust_c.last_name)                               AS "Contract Officer Last Name",
        MAX(cust_c.middle_initial)                          AS "Contract Officer Middle Initial",
        MAX(cust_c_ph.phone)                                AS "Contract Officer Phone Number",
        MAX(c.prime_or_sub)                                 AS "Prime or Sub",
        MAX(ec.customer_code)                               AS "End Customer Org Code",
        MAX(ec.customer_name)                               AS "End Customer Org Name",
        MAX(mc.contract_code)                               AS "Master Contract Code",
        MAX(mc.contract_title)                              AS "Master Contract Title",
        MAX(c.award_date)                                   AS "Award Date",
        MAX(c.begin_date)                                   AS "Original Begin Date",
        MAX(c.end_date)                                     AS "Original End Date",
        MIN(p.rev_start_date)                               AS "Revised Begin Date",
        MAX(p.rev_end_date)                                 AS "Revised End Date",
        MAX(c.contract_purpose)                             AS "Purpose",
        SUM(COALESCE(p.total_value, 0)) + COALESCE(MAX(st.total_value), 0)     AS "Project Total Value",
        SUM(COALESCE(p.total_cost, 0))  + COALESCE(MAX(st.total_cost), 0)      AS "Project Total Cost",
        SUM(COALESCE(p.total_fee, 0))   + COALESCE(MAX(st.total_fee), 0)       AS "Project Total Fee",
        SUM(COALESCE(p.funded_value, 0)) + COALESCE(MAX(st.funded_value), 0)   AS "Project Funded Value",
        SUM(COALESCE(p.funded_cost, 0))  + COALESCE(MAX(st.funded_cost), 0)    AS "Project Funded Cost",
        SUM(COALESCE(p.funded_fee, 0))   + COALESCE(MAX(st.funded_fee), 0)     AS "Project Funded Fee",
        MAX(c.user01)                                       AS "Contract User01",
        MAX(c.user02)                                       AS "Contract User02",
        MAX(c.user03)                                       AS "Contract User03",
        MAX(c.user04)                                       AS "Contract User04",
        MAX(c.user05)                                       AS "Contract User05",
        MAX(c.user06)                                       AS "Contract User06",
        MAX(c.user07)                                       AS "Contract User07",
        MAX(c.user08)                                       AS "Contract User08",
        MAX(c.user09)                                       AS "Contract User09",
        MAX(c.user10)                                       AS "Contract User10",
        MAX(c.user11)                                       AS "Contract User11",
        MAX(c.user12)                                       AS "Contract User12",
        MAX(c.user13)                                       AS "Contract User13",
        MAX(c.user14)                                       AS "Contract User14",
        MAX(c.user15)                                       AS "Contract User15",
        MAX(c.user16)                                       AS "Contract User16",
        MAX(c.user17)                                       AS "Contract User17",
        MAX(c.user18)                                       AS "Contract User18",
        MAX(c.user19)                                       AS "Contract User19",
        MAX(c.user20)                                       AS "Contract User20",
        MAX(ct.contract_types)                              AS "Contract Type",

        /* Replace Oracle TRIM/|| with T-SQL that avoids stray hyphens if a side is missing */
        MAX(
            CASE 
                WHEN (ncp.code IS NULL OR LTRIM(RTRIM(ncp.code)) = '')
                     THEN COALESCE(ncp.description, '')
                WHEN (ncp.description IS NULL OR LTRIM(RTRIM(ncp.description)) = '')
                     THEN COALESCE(ncp.code, '')
                ELSE CONCAT(ncp.code, '-', ncp.description)
            END
        )                                                   AS "NAICS Code (primary)",

        MAX(
            CASE 
                WHEN (ncs.code IS NULL OR LTRIM(RTRIM(ncs.code)) = '')
                     THEN COALESCE(ncs.description, '')
                WHEN (ncs.description IS NULL OR LTRIM(RTRIM(ncs.description)) = '')
                     THEN COALESCE(ncs.code, '')
                ELSE CONCAT(ncs.code, '-', ncs.description)
            END
        )                                                   AS "NAICS Code (supporting)",

        MAX(css.socioeconomic_status)                       AS "Socioeconomic Status",
        MAX(c.sbsa_flag)                                    AS "Small Business Set Aside",
        MAX(c.sbsa_recertification_date)                    AS "SBSA Recertification Date",
        CASE 
            WHEN MAX(c.business_size_classification) = 'L' THEN 'Large'
            WHEN MAX(c.business_size_classification) = 'S' THEN 'Small'
            WHEN MAX(c.business_size_classification) = 'N' THEN 'Non-Profit'
            WHEN MAX(c.business_size_classification) = 'F' THEN 'Foreign/Other'
            ELSE NULL
        END                                                 AS "Business Size Classification",
        MAX(ci.industry_names)                              AS "Industry",
        MAX(ba.first_name)                                  AS "Billing Analyst First Name",
        MAX(ba.last_name)                                   AS "Billing Analyst Last Name",
        MAX(c.dcaa_office)                                  AS "DCAA Office",
        MAX(c.dpas_purchase_rating)                         AS "DPAS Purchase Rating",
        MAX(le.customer_code)                               AS "Legal Entity Code",
        MAX(c.classified_contract_flag)                     AS "Classified Contract",
        MAX(c.usc_restrictions_flag)                        AS "US Citizenship Restrictions",
        CASE 
            WHEN MAX(c.security_clearance) = 'C' THEN 'Confidential'
            WHEN MAX(c.security_clearance) = 'T' THEN 'Top Secret'
            WHEN MAX(c.security_clearance) = 'S' THEN 'Secret'
            ELSE NULL
        END                                                 AS "Security Clearance",
        MAX(c.other_clearance)                              AS "Other Clearance",
        MAX(ccc.iso_currency_code)                          AS "Contract Currency Code"
    FROM [dbo].["aretum"."contract"] c
    LEFT OUTER JOIN [dbo].["aretum"."contract"] mc
        ON c.prime_contract_key = mc.contract_key
    INNER JOIN [dbo].["aretum"."contract_status"] cs
        ON cs.contract_status_key = c.contract_status_key
    LEFT OUTER JOIN [dbo].["aretum"."person"] m
        ON m.person_key = c.contract_manager_key
    LEFT OUTER JOIN [dbo].["aretum"."customer"] oo
        ON oo.customer_key = c.owning_org_key
    LEFT OUTER JOIN [dbo].["aretum"."customer"] cust
        ON cust.customer_key = c.customer_key
    LEFT OUTER JOIN [dbo].["aretum"."customer"] ec
        ON ec.customer_key = c.end_customer_key
    LEFT OUTER JOIN [dbo].["aretum"."project"] p
        ON p.contract_key = c.contract_key
    LEFT OUTER JOIN sub_totals st
        ON st.contract_key = c.contract_key
    LEFT OUTER JOIN contract_types ct
        ON ct.contract_key = c.contract_key
    LEFT OUTER JOIN [dbo].["aretum"."customer_contact"] cust_c
        ON c.contract_officer = cust_c.customer_contact_key
    LEFT OUTER JOIN [dbo].["aretum"."contact_phone"] cust_c_ph
        ON cust_c.customer_contact_key = cust_c_ph.customer_contact_key
       AND cust_c_ph.primary_ind = 'Y'
    LEFT OUTER JOIN [dbo].["aretum"."person"] ba
        ON ba.person_key = c.contract_billing_analyst_key
    LEFT OUTER JOIN [dbo].["aretum"."customer"] le
        ON le.customer_key = oo.legal_entity_key
    LEFT OUTER JOIN c_se_status css
        ON css.contract_key = c.contract_key
    LEFT OUTER JOIN c_ind ci
        ON ci.contract_key = c.contract_key
    LEFT OUTER JOIN [dbo].["aretum"."naics_code"] ncp
        ON ncp.naics_code_key = c.naics_code_key_primary
    LEFT OUTER JOIN [dbo].["aretum"."naics_code"] ncs
        ON ncs.naics_code_key = c.naics_code_key_supporting
    JOIN [dbo].["aretum"."currency_code"] ccc
        ON ccc.currency_code_key = c.currency_code_key
    WHERE
        (
            EXISTS (SELECT 1 FROM [dbo].["aretum"."member"] WHERE person_key = '3896' AND role_key IN (1,21))
        )
        OR
        (
            (
                EXISTS (
                    SELECT 1 FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = '3896'
                      AND oap.access_type = 1
                      AND oap.role_key = 57
                )
                OR c.customer_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = '3896'
                      AND oap.access_type = 1
                      AND oap.role_key = 57
                )
            )
            OR
            (
                EXISTS (
                    SELECT 1 FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = '3896'
                      AND oap.access_type = 4
                      AND oap.role_key = 57
                )
                OR c.owning_org_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = '3896'
                      AND oap.access_type = 4
                      AND oap.role_key = 57
                )
            )
        )
        OR
        (
            (
                EXISTS (
                    SELECT 1 FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = '3896'
                      AND oap.access_type = 1
                      AND oap.role_key = 58
                )
                OR c.customer_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = '3896'
                      AND oap.access_type = 1
                      AND oap.role_key = 58
                )
            )
            OR
            (
                EXISTS (
                    SELECT 1 FROM [dbo].["aretum"."org_access_person"] oap
                    WHERE oap.global_access = 'Y'
                      AND oap.person_key = '3896'
                      AND oap.access_type = 4
                      AND oap.role_key = 58
                )
                OR c.owning_org_key IN (
                    SELECT h.customer_key
                    FROM [dbo].["aretum"."org_access_hierarchy"] h
                    JOIN [dbo].["aretum"."org_access_person"] oap
                      ON oap.org_access_person_key = h.org_access_person_key
                    WHERE oap.person_key = '3896'
                      AND oap.access_type = 4
                      AND oap.role_key = 58
                )
            )
        )
    GROUP BY
        c.contract_key, c.customer_key, c.owning_org_key
)
SELECT
    wrE4."Owning Org Name"      AS c0,
    wrE4."Contract Title"       AS c1,
    wrE4."Master Contract Code" AS c2,
    wrE4."Contract Code"        AS c3,
    wrE4."Owning Org Code"      AS c4,
    wrE4."Project Funded Value" AS c5,
    wrE4."Project Total Value"  AS c6,
    wrE4."Contract User04"      AS c7,
    wrE4."Contract User05"      AS c8,
    wrE4."Contract Status"      AS c9,
    wrE4."Contract User06"      AS c10,
    wrE4."Contract Key"         AS c11
FROM main_q wrE4;
GO