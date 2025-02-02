with int_model as (
    select *
    from {{ ref('int_2023_02') }}
),

final as (
    select
        transaction_id,
        'GB' || check_digits || swift_code || replace(sort_code, '-', '') || account_number as iban
    from int_model
)

select *
from final