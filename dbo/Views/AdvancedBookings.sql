SELECT
    wrE4."Owning Org Name" AS c0,
    wrE4."Contract Title" AS c1,
    wrE4."Master Contract Code" AS c2,
    wrE4."Contract Code" AS c3,
    wrE4."Owning Org Code" AS c4,
    wrE4."Project Funded Value" AS c5,
    wrE4."Project Total Value" AS c6,
    wrE4."Contract User04" AS c7,
    wrE4."Contract User05" AS c8,
    wrE4."Contract Status" AS c9,
    wrE4."Contract User06" AS c10,
    wrE4."Contract Key" AS c11
FROM (
    with sub_totals as (
        select
            c.contract_key,
            sum(coalesce(sub_p.total_value ,0)) 	as total_value,
            sum(coalesce(sub_p.total_cost ,0)) 	as total_cost,
            sum(coalesce(sub_p.total_fee ,0)) 	as total_fee,
            sum(coalesce(sub_p.funded_value ,0)) as funded_value,
            sum(coalesce(sub_p.funded_cost ,0)) 	as funded_cost,
            sum(coalesce(sub_p.funded_fee ,0)) 	as funded_fee
        from contract c
        left outer join contract sub_c
            on sub_c.prime_contract_key = c.contract_key
        left outer join project sub_p
            on sub_p.contract_key = sub_c.contract_key
        group by c.contract_key
    ),
    contract_types as (
        select
            cta.contract_key,
            STRING_AGG(ct.contract_type, ',') as contract_types
        from contract_type_assignment cta
        join contract_type ct
            on cta.contract_type_key = ct.contract_type_key
        group by cta.contract_key
    ),
    c_se_status as (
        select
            STRING_AGG(ss.name, ',') as socioeconomic_status,
            css1.contract_key
        from contract_socioeconomic_status css1
        join socioeconomic_status ss
            on ss.socioeconomic_status_key = css1.socioeconomic_status_key
        group by css1.contract_key
    ),
    c_ind as (
        select
            STRING_AGG(i.name, ',') as industry_names,
            ci1.contract_key
        from contract_industry ci1
        join industry i
            on i.industry_key  = ci1.industry_key
        group by ci1.contract_key
    )
    select
        c.contract_key 					as "Contract Key",
        max(c.contract_code) 				as "Contract Code",
        max(c.contract_title) 				as "Contract Title",
        max(cs.status) 						as "Contract Status",
        max(c.ceiling_amount) 				as "Ceiling Amount",
        max(m.first_name) 					as "Contract Manager First Name",
        max(m.last_name) 					as "Contract Manager Last Name",
        max(m.middle_initial) 				as "Contract Manager Middle Initial",
        max(m.username) 						as "Contract Manager Username",
        max(oo.customer_code) 				as "Owning Org Code",
        max(oo.customer_name) 				as "Owning Org Name",
        max(cust.customer_code) 			as "Customer Org Code",
        max(cust.customer_name) 			as "Customer Org Name",
        max(cust_c.first_name) 					as "Contract Officer First Name",
        max(cust_c.last_name) 					as "Contract Officer Last Name",
        max(cust_c.middle_initial) 				as "Contract Officer Middle Initial",
        max(cust_c_ph.phone) 					as "Contract Officer Phone Number",
        max(c.prime_or_sub) 					as "Prime or Sub",
        max(ec.customer_code) 				as "End Customer Org Code",
        max(ec.customer_name) 				as "End Customer Org Name",
        max(mc.contract_code) 				as "Master Contract Code",
        max(mc.contract_title) 				as "Master Contract Title",
        max(c.award_date) 					as "Award Date",
        max(c.begin_date) 				    as "Original Begin Date",
        max(c.end_date) 				        as "Original End Date",
        min(p.rev_start_date) 					as "Revised Begin Date",
        max(p.rev_end_date) 					as "Revised End Date",
        max(c.contract_purpose) 				as "Purpose",
        sum(coalesce(p.total_value ,0)) + coalesce(max(st.total_value) ,0)	as "Project Total Value",
        sum(coalesce(p.total_cost ,0)) + coalesce(max(st.total_cost) ,0) 		as "Project Total Cost",
        sum(coalesce(p.total_fee ,0)) + coalesce(max(st.total_fee) ,0) 		as "Project Total Fee",
        sum(coalesce(p.funded_value ,0)) + coalesce(max(st.funded_value) ,0) 	as "Project Funded Value",
        sum(coalesce(p.funded_cost ,0)) + coalesce(max(st.funded_cost) ,0) 	as "Project Funded Cost",
        sum(coalesce(p.funded_fee ,0)) + coalesce(max(st.funded_fee) ,0) 		as "Project Funded Fee",
        max(c.user01)                        as "Contract User01",
        max(c.user02)                        as "Contract User02",
        max(c.user03)                        as "Contract User03",
        max(c.user04)                        as "Contract User04",
        max(c.user05)                        as "Contract User05",
        max(c.user06)                        as "Contract User06",
        max(c.user07)                        as "Contract User07",
        max(c.user08)                        as "Contract User08",
        max(c.user09)                        as "Contract User09",
        max(c.user10)                        as "Contract User10",
        max(c.user11)                        as "Contract User11",
        max(c.user12)                        as "Contract User12",
        max(c.user13)                        as "Contract User13",
        max(c.user14)                        as "Contract User14",
        max(c.user15)                        as "Contract User15",
        max(c.user16)                        as "Contract User16",
        max(c.user17)                        as "Contract User17",
        max(c.user18)                        as "Contract User18",
        max(c.user19)                        as "Contract User19",
        max(c.user20)                        as "Contract User20",
        max(ct.contract_types)				 as "Contract Type",
        max(trim('-' from ncp.code || '-' || ncp.description)) 				 as "NAICS Code (primary)",
        max(trim('-' from ncs.code || '-' || ncs.description))  			 as "NAICS Code (supporting)",
        max(css.socioeconomic_status) 		as "Socioeconomic Status",
        max(c.sbsa_flag) 					as "Small Business Set Aside",
        max(c.sbsa_recertification_date) 	as "SBSA Recertification Date",
        case
            when max(c.business_size_classification) = 'L' then 'Large'
            when max(c.business_size_classification) = 'S' then 'Small'
            when max(c.business_size_classification) = 'N' then 'Non-Profit'
            when max(c.business_size_classification) = 'F' then 'Foreign/Other'
            else null
        end                                  as "Business Size Classification",
        max(ci.industry_names) as "Industry",
        max(ba.first_name) 					as "Billing Analyst First Name",
        max(ba.last_name) 					as "Billing Analyst Last Name",
        max(c.dcaa_office) 					as "DCAA Office",
        max(c.dpas_purchase_rating) 		as "DPAS Purchase Rating",
        max(le.customer_code) 				as "Legal Entity Code",
        max(c.classified_contract_flag) 	as "Classified Contract",
        max(c.usc_restrictions_flag) 		as "US Citizenship Restrictions",
        case
            when max(c.security_clearance) = 'C' then 'Confidential'
            when max(c.security_clearance) = 'T' then 'Top Secret'
            when max(c.security_clearance) = 'S' then 'Secret'
            else null
        end                   "Security Clearance",
        max(c.other_clearance) 				as "Other Clearance",
        max(ccc.iso_currency_code) 			as "Contract Currency Code"
    from contract c
    left outer join contract mc
        on c.prime_contract_key = mc.contract_key
    inner join contract_status cs
        on cs.contract_status_key = c.contract_status_key
    left outer join person m
        on m.person_key = c.contract_manager_key
    left outer join customer oo
        on oo.customer_key = c.owning_org_key
    left outer join customer cust
        on cust.customer_key = c.customer_key
    left outer join customer ec
        on ec.customer_key = c.end_customer_key
    left outer join project p
        on p.contract_key = c.contract_key
    left outer join sub_totals st
        on st.contract_key = c.contract_key
    left outer join contract_types ct
        on ct.contract_key = c.contract_key
    left outer join customer_contact cust_c
        on c.contract_officer = cust_c.customer_contact_key
    left outer join contact_phone cust_c_ph
        on cust_c.customer_contact_key = cust_c_ph.customer_contact_key
        and cust_c_ph.primary_ind = 'Y'
    left outer join person ba
        on ba.person_key = c.contract_billing_analyst_key
    left outer join customer le
        on le.customer_key = oo.legal_entity_key
    left outer join c_se_status css
        on css.contract_key = c.contract_key
    left outer join c_ind ci
        on ci.contract_key = c.contract_key
    left outer join naics_code ncp
        on ncp.naics_code_key = c.naics_code_key_primary
    left outer join naics_code ncs
        on ncs.naics_code_key = c.naics_code_key_supporting
    join currency_code ccc
        on ccc.currency_code_key = c.currency_code_key
    where
        (exists (
            select 'x'
            from member
            where person_key = '3896'
              and role_key in (1,21)
        ))
        or (
            (
                exists (
                    select 'x'
                    from org_access_person oap
                    where oap.global_access = 'Y'
                      and oap.person_key = '3896'
                      and oap.access_type = 1
                      and oap.role_key = 57
                )
                or c.customer_key in (
                    select h.customer_key
                    from org_access_hierarchy h
                    join org_access_person oap
                        on oap.org_access_person_key = h.org_access_person_key
                    where oap.person_key = '3896'
                      and oap.access_type = 1
                      and oap.role_key = 57
                )
            )
            or (
                exists (
                    select 'x'
                    from org_access_person oap
                    where oap.global_access = 'Y'
                      and oap.person_key = '3896'
                      and oap.access_type = 4
                      and oap.role_key = 57
                )
                or c.owning_org_key in (
                    select h.customer_key
                    from org_access_hierarchy h
                    join org_access_person oap
                        on oap.org_access_person_key = h.org_access_person_key
                    where oap.person_key = '3896'
                      and oap.access_type = 4
                      and oap.role_key = 57
                )
            )
        )
        or (
            (
                exists (
                    select 'x'
                    from org_access_person oap
                    where oap.global_access = 'Y'
                      and oap.person_key = '3896'
                      and oap.access_type = 1
                      and oap.role_key = 58
                )
                or c.customer_key in (
                    select h.customer_key
                    from org_access_hierarchy h
                    join org_access_person oap
                        on oap.org_access_person_key = h.org_access_person_key
                    where oap.person_key = '3896'
                      and oap.access_type = 1
                      and oap.role_key = 58
                )
            )
            or (
                exists (
                    select 'x'
                    from org_access_person oap
                    where oap.global_access = 'Y'
                      and oap.person_key = '3896'
                      and oap.access_type = 4
                      and oap.role_key = 58
                )
                or c.owning_org_key in (
                    select h.customer_key
                    from org_access_hierarchy h
                    join org_access_person oap
                        on oap.org_access_person_key = h.org_access_person_key
                    where oap.person_key = '3896'
                      and oap.access_type = 4
                      and oap.role_key = 58
                )
            )
        )
    group by
        c.contract_key,
        c.customer_key,
        c.owning_org_key
) wrE4
ORDER BY
    wrE4."Owning Org Name" ASC
