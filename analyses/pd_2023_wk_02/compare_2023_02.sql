{% set legacy_build=ref('pd_2023_02') %} 

{% set dbt_build=ref('fct_2023_02') %}  {{ 

audit_helper.compare_relations(
        a_relation=legacy_build,
        b_relation=dbt_build,
        primary_key="transaction_id"
    ) }}