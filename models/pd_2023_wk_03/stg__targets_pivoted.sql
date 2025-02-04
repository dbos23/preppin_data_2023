with src_targets as (
    select *
    from {{ source('pd_2023', 'pd2023_wk03_targets') }}
)

select *
from src_targets
    unpivot(targets for quarter in (Q1, Q2, Q3, Q4))
    order by online_or_in_person, quarter