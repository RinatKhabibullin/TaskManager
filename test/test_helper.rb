ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'coveralls'

if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
  SimpleCov.start 'rails'
  puts "required simplecov"
end

Coveralls.wear!

class ActiveSupport::TestCase
  include AuthHelper
  include FactoryBot::Syntax::Methods
end
