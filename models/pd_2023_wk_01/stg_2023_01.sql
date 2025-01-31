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
from {{ source('pd_2023', 'pd2023_wk01') }}