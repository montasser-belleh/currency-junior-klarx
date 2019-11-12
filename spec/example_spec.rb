require 'spec_helper'

describe 'Application' do

  it "index works!" do
    get '/'
    expect(last_response.status).to eq 200
  end

  it "conversion works!" do
    post '/conversion', 
            :original_sum =>'10',
            :initial_currency => 'EUR',
            :target_currency => 'CHF'
    expect(last_response.status).to eq 200
  end

end

describe Conversion do
  it 'successefully created a new conversion object' do
    conversion = Conversion.new
    expect(conversion).to be_an_instance_of(Conversion)
  end
end

describe Money::Bank::CurrencylayerBank do

  describe 'without rates' do
    it 'able to exchange a money to its own currency even without rates' do
      money = Money.new(100000, 'USD')
      expect(money.exchange_to('USD')).to eq money
    end
  end

  describe 'with updated rates' do
    before do
      mclb = Money::Bank::CurrencylayerBank.new
      mclb.access_key = '3175727a144294d40971712b7e826001'
      mclb.update_rates
      Money.default_bank = mclb
      not_expired = mclb.expired?
      expect(not_expired).to be_truthy
    end

    it 'able to change money from USD to EUR' do
      money = Money.new(1000,'USD')
      expect(money.exchange_to('EUR')).to_not be_nil
    end

    it 'able to change money from EUR to USD' do
      money = Money.new(1000,'EUR')
      expect(money.exchange_to('USD')).to_not be_nil
    end

    it 'able to change money from USD to CHF' do
      money = Money.new(1000,'USD')
      expect(money.exchange_to('CHF')).to_not be_nil
    end

    it 'able to change money from CHF to USD' do
      money = Money.new(1000,'CHF')
      expect(money.exchange_to('USD')).to_not be_nil
    end
    
    it 'able to change money from CHF to EUR' do
      money = Money.new(1000,'CHF')
      expect(money.exchange_to('EUR')).to_not be_nil
    end
    
    it 'able to change money from EUR to CHF' do
      money = Money.new(1000,'EUR')
      expect(money.exchange_to('CHF')).to_not be_nil
    end

  end



end

