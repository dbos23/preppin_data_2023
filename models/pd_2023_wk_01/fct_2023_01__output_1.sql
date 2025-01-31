select
    bank,
    sum(value) as value
from {{ ref('stg_2023_01') }}
group by bank