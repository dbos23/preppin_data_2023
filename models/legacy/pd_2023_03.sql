with cte1 as
    (select
         case
                when online_or_in_person = 1 then 'online'
                when online_or_in_person = 2 then 'in-person'
                end as online_or_in_person,
        date_part('quarter', to_date(left(transaction_date, 10), 'DD/MM/YYYY')) as quarter,
        sum(value) as value
    from til_playground.preppin_data_inputs.pd2023_wk01
    where split_part(transaction_code, '-', 1) = 'DSB'
    group by all),

    cte2 as
    (select *
    from til_playground.preppin_data_inputs.pd2023_wk03_targets
        unpivot(targets for quarter in (Q1, Q2, Q3, Q4))
        order by online_or_in_person)

select
    cte1.online_or_in_person,
    cte1.quarter,
    value,
    targets as quarterly_targets,
    value - targets as variance_to_target
    
from cte1 join cte2
    on cte1.quarter = replace(cte2.quarter, 'Q', '')::numeric
    and cte1.online_or_in_person = lower(cte2.online_or_in_person)