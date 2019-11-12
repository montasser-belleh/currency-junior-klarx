# loading the app
require File.join(File.dirname(__FILE__), '..', 'config/environment')
# requiring test gems
require 'rack/test'
require 'rspec'
require 'money/bank/currencylayer_bank'

# setting env
set :environment, :test

# Creating a Mixin
module RSpecMixin
  include Rack::Test::Methods
  def app() ApplicationController end
end

RSpec.configure { |c| c.include RSpecMixin }