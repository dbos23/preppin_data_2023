select
    bank,
    online_or_in_person,
    decode(
        extract(dayofweek from transaction_date),
            1, 'Monday',
            2, 'Tuesday',
            3, 'Wednesday',
            4, 'Thursday',
            5, 'Friday',
            6, 'Saturday',
            7, 'Sunday') as transaction_date,
    sum(value) as value
from {{ ref('stg_2023_01') }}
group by all