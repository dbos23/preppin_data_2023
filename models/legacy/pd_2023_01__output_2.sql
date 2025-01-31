/*
PD 2023 Week 1
Tasks:
- Split the Transaction Code to extract the letters at the start of the transaction code. These identify the bank that processes the transaction
- Rename the new field with the bank code 'Bank'. 
- Rename the values in the Online or In-person field, Online for the 1 values and In-Person for the 2 values. 
- Change the date to be the day of the week
- Different levels of detail are required in the outputs. You will need to sum up the values of the transactions in three ways:
    1. Total values of transactions by each bank
    2. Total values by bank, day of the week and type of transaction (online or in-person)
    3. Total values by bank and customer code
*/

--Output 2: Total values by bank, day of the week and type of transaction
with cte as
    (select
        split_part(transaction_code, '-', 1) as bank,
        case
            when online_or_in_person = 1 then 'online'
            when online_or_in_person = 2 then 'in-person'
            end as online_or_in_person,
        decode(extract(dayofweek from to_date(left(transaction_date, 10), 'DD/MM/YYYY')),
            1, 'Monday',
            2, 'Tuesday',
            3, 'Wednesday',
            4, 'Thursday',
            5, 'Friday',
            6, 'Saturday',
            7, 'Sunday') as transaction_date,
        value
    from til_playground.preppin_data_inputs.pd2023_wk01)

select
    bank,
    online_or_in_person,
    transaction_date,
    sum(value) as value
from cte
group by all