with stg as (
    select *
    from {{ ref('stg__transactions') }}
)

select
    online_or_in_person,
    date_part('quarter', transaction_date) as quarter,
    sum(value) as value
from stg
where bank = 'DSB'
group by all