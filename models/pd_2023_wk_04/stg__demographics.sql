with jan as (
    select *
    from {{ source('pd_2023', 'pd2023_wk04_january') }}
),

feb as (
    select *
    from {{ source('pd_2023', 'pd2023_wk04_february') }}
),

mar as (
    select *
    from {{ source('pd_2023', 'pd2023_wk04_march') }}
),

apr as (
    select *
    from {{ source('pd_2023', 'pd2023_wk04_april') }}
),

may as (
    select *
    from {{ source('pd_2023', 'pd2023_wk04_may') }}
),

jun as (
    select *
    from {{ source('pd_2023', 'pd2023_wk04_june') }}
),

jul as (
    select *
    from {{ source('pd_2023', 'pd2023_wk04_july') }}
),

aug as (
    select *
    from {{ source('pd_2023', 'pd2023_wk04_august') }}
),

sep as (
    select *
    from {{ source('pd_2023', 'pd2023_wk04_september') }}
),

oct as (
    select *
    from {{ source('pd_2023', 'pd2023_wk04_october') }}
),

nov as (
    select *
    from {{ source('pd_2023', 'pd2023_wk04_november') }}
),

dece as (
    select *
    from {{ source('pd_2023', 'pd2023_wk04_december') }}
),

unioned as (
    select *, '01' as mon from jan
    union
    select *, '02' as mon from feb
    union
    select *, '03' as mon from mar
    union
    select *, '04' as mon from apr
    union
    select *, '05' as mon from may
    union
    select *, '06' as mon from jun
    union
    select *, '07' as mon from jul
    union
    select *, '08' as mon from aug
    union
    select *, '09' as mon from sep
    union
    select *, '10' as mon from oct
    union
    select *, '11' as mon from nov
    union
    select *, '12' as mon from dece
)

select
    id,
    demographic,
    value,
    to_date(mon || right('0'|| joining_day::string, 2) || '2023', 'MMDDYYYY') as joining_date
from unioned