with q_targets as (
    select *
    from {{ ref('stg__targets_pivoted') }}
),

transactions as (
    select *
    from {{ ref('int__quarterly_transactions') }}
),

joined as (
    select
        transactions.online_or_in_person,
        transactions.quarter,
        value,
        targets as quarterly_targets,
        value - targets as variance_to_target
    from transactions inner join q_targets
        on transactions.online_or_in_person = lower(q_targets.online_or_in_person)
        and transactions.quarter = replace(q_targets.quarter, 'Q', '')::numeric
)

select *
from joined