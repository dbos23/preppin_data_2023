{% set legacy_build_3=ref('pd_2023_01__output_3') %} 

{% set dbt_build_3=ref('fct_2023_01__output_3') %}  {{ 

audit_helper.compare_relations(
        a_relation=legacy_build_3,
        b_relation=dbt_build_3,
    ) }}