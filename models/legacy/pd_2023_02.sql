select
    transaction_id,
    'GB' || check_digits || swift_code || replace(sort_code, '-', '') || account_number as iban
from til_playground.preppin_data_inputs.pd2023_wk02_transactions t join til_playground.preppin_data_inputs.pd2023_wk02_swift_codes s
    on t.bank = s.bank