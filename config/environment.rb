# Setting the app envirement
ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"
# Add the needed requirement to boot the app
require 'bundler/setup'
require 'rubygems'
require 'data_mapper'
Bundler.require(:default, ENV['SINATRA_ENV'])

# Setting DataMapper database connection

database_url = "postgres://currencydbuser:klarx@127.0.0.1/currencydb"
DataMapper.setup(:default, database_url)

# Loading all the files in app folder
require_all 'app'