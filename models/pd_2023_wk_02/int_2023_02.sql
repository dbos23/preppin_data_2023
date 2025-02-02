with transactions as (
    select *
    from {{ source('pd_2023', 'pd2023_wk02_transactions') }}
),

swift_codes as (
    select *
    from {{ source('pd_2023', 'pd2023_wk02_swift_codes') }}
),

joined as (
    select
        transactions.*,
        swift_code,
        check_digits
    from transactions inner join swift_codes
        on transactions.bank = swift_codes.bank
)

select *
from joined