with stg as (
    select *
    from {{ ref('stg__demographics') }}
)

select
    *,
    row_number() over(partition by id order by joining_date asc) as row_num
from stg
    pivot(
        max(value)
        for demographic in ('Ethnicity', 'Account Type', 'Date of Birth')
    )  as pvt(id, joining_date, ethnicity, account_type, date_of_birth)