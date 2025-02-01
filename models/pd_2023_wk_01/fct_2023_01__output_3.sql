with stg as (
    select *
    from {{ ref('stg_2023_01') }}
),

final as (
    select
        bank,
        customer_code,
        sum(value) as value
    from stg
    group by all
)

select *
from final