with int__demo as (
    select *
    from {{ ref('int__demographics_pivoted') }}
)

select
    id,
    joining_date,
    account_type,
    to_date(date_of_birth, 'MM/DD/YYYY') as date_of_birth,
    ethnicity
from int__demo
where row_num = 1