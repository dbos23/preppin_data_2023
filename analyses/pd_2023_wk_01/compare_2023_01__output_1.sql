{% set legacy_build_1=ref('pd_2023_01__output_1') %} 

{% set dbt_build_1=ref('fct_2023_01__output_1') %}  {{ 

audit_helper.compare_relations(
        a_relation=legacy_build_1,
        b_relation=dbt_build_1,
        primary_key="bank"
    ) }}