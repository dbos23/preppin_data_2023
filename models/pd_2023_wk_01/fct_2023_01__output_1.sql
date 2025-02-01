with stg as (
    select *
    from {{ ref('stg_2023_01') }}
),

final as (
    select
        bank,
        sum(value) as value
    from stg
    group by bank
)

select *
from final