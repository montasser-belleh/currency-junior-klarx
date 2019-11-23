require 'money'
require 'money/bank/currencylayer_bank'

mclb = Money::Bank::CurrencylayerBank.new
mclb.access_key = open('app/api_key.txt').read
mclb.update_rates
Money.default_bank = mclb