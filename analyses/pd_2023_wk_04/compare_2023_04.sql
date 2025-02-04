{% set legacy_build=ref('pd_2023_04') %} 

{% set dbt_build=ref('dim__demographics') %}  {{ 

audit_helper.compare_relations(
        a_relation=legacy_build,
        b_relation=dbt_build
    ) }}