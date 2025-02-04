-- Similar transformations were required for this and the challenge for pd_2023_wk_01
-- The same staging model is repeated here for clarity in the event someone is only looking at my solutions for this challenge

with src_data as (
    select *
    from {{ source('pd_2023', 'pd2023_wk01') }}
),

stg as (
    select
        transaction_code,
        value,
        split_part(transaction_code, '-', 1) as bank,
        customer_code,
        to_date(left(transaction_date, 10),'dd/mm/yyyy') as transaction_date,
        case
            when online_or_in_person = 1 then 'online'
            when online_or_in_person = 2 then 'in-person'
            end as online_or_in_person
    from src_data
)

select *
from stg