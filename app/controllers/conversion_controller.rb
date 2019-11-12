class ConversionController < ApplicationController
    
    post '' do

		# retrieving user inputs 
		@original_sum = params['original_sum']
		@original = params['initial_currency']
    @converted = params['target_currency']
        	
	#converting using the api
		#the entered value is always in cents (or what matches it) for the API
		#for example Money.new(100) is just 1$, it works for most of currencies
		#where it has a cent based system, not for the TND (Tunisian Dinar) for example
		#where 1000 millimes = 1 TND
		#so to avoid confusion, we will multiply the entry by 100
		@unit = 100 * @original_sum.to_f
		#convert + get the rate
		@converted_sum = Money.new(@unit,@original).exchange_to(@converted).to_f
		@rate = Money.default_bank.get_rate(@original, @converted)
			
	#creating a conversion item and saving it to the DB
		con = Conversion.create(
				:original_sum => @original_sum,
				:converted_sum => @converted_sum,
				:initial_currency => @original,
				:target_currency => @converted,
				:date => Time.now)
		
		erb :convert
    end
end