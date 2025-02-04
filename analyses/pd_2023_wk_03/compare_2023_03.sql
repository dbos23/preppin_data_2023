{% set legacy_build=ref('pd_2023_03') %} 

{% set dbt_build=ref('fct__quarterly_performance') %}  {{ 

audit_helper.compare_relations(
        a_relation=legacy_build,
        b_relation=dbt_build
    ) }}