{% set legacy_build_2=ref('pd_2023_01__output_2') %} 

{% set dbt_build_2=ref('fct_2023_01__output_2') %}  {{ 

audit_helper.compare_relations(
        a_relation=legacy_build_2,
        b_relation=dbt_build_2,
    ) }}