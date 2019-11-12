require_relative './config/environment'
require 'sinatra/base'
require 'logger'

Logger.class_eval { alias :write :'<<'}
access_log = ::File.join(::File.dirname(::File.expand_path(__FILE__)),'log','access.log')
access_logger = ::Logger.new(access_log)
error_logger = ::File.new(::File.join(::File.dirname(::File.expand_path(__FILE__)),'log','error.log'),"a+")
error_logger.sync = true
before {
    env['rack.errors'] = error_log
}

configure do
    use Rack::CommonLogger, access_logger
end

map('/convert'){run ConversionController }
map('/history'){run HistoryController }
map('/'){run ApplicationController }
