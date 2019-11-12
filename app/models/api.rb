require 'money'
require 'money/bank/currencylayer_bank'

mclb = Money::Bank::CurrencylayerBank.new
mclb.access_key = '3175727a144294d40971712b7e826001'
mclb.update_rates
Money.default_bank = mclb