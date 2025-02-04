with cte1 as
(   select *, '01' as mon from til_playground.preppin_data_inputs.pd2023_wk04_january
    union 
    select *, '02' as mon from til_playground.preppin_data_inputs.pd2023_wk04_february
    union
    select *, '03' as mon from til_playground.preppin_data_inputs.pd2023_wk04_march
    union
    select *, '04' as mon from til_playground.preppin_data_inputs.pd2023_wk04_april
    union
    select *, '05' as mon from til_playground.preppin_data_inputs.pd2023_wk04_may
    union
    select *, '06' as mon from til_playground.preppin_data_inputs.pd2023_wk04_june
    union
    select *, '07' as mon from til_playground.preppin_data_inputs.pd2023_wk04_july
    union
    select *, '08' as mon from til_playground.preppin_data_inputs.pd2023_wk04_august
    union
    select *, '09' as mon from til_playground.preppin_data_inputs.pd2023_wk04_september
    union
    select *, '10' as mon from til_playground.preppin_data_inputs.pd2023_wk04_october
    union
    select *, '11' as mon from til_playground.preppin_data_inputs.pd2023_wk04_november
    union
    select *, '12' as mon from til_playground.preppin_data_inputs.pd2023_wk04_december),
    
cte2 as
    (select
        id,
        to_date(mon || right('0'|| joining_day::string, 2) || '2023', 'MMDDYYYY') as joining_date,
        demographic,
        value
    from cte1),
    
cte3 as (select
            id,
            joining_date,
            ethnicity,
            account_type,
            date_of_birth,
            row_number() over(partition by id order by joining_date asc) as row_num
        from cte2
            pivot(max(value) for demographic in ('Ethnicity', 'Account Type', 'Date of Birth')) as pvt(id, joining_date, ethnicity, account_type, date_of_birth))

select
    id,
    joining_date,
    account_type,
    to_date(date_of_birth, 'MM/DD/YYYY') as date_of_birth,
    ethnicity
from cte3
where row_num = 1