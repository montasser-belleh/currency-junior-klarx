# For the documentation check http://sinatrarb.com/intro.html
class ApplicationController < Sinatra::Base
	# This configuration part will inform the app where to search for the views and from where it will serve the static files
  	configure do
    	set :views, "app/views"
    	set :public_dir, "public"
	end

	get '/' do
   		erb :index
	end

	post '/' do
		erb :index
	end
	
	post '/conversion' do
		erb :convert
	end
	
	post '/history' do
		erb :history
	end
end