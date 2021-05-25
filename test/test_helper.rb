ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'simplecov'

SimpleCov.start 'rails' do
  if ENV['CI']
    formatter SimpleCov::Formatter::SimpleFormatter
  else
    formatter SimpleCov::Formatter::MultiFormatter.new([
      SimpleCov::Formatter::SimpleFormatter,
      SimpleCov::Formatter::HTMLFormatter
    ])
  end
end

require 'coveralls'

Coveralls.wear!

class ActiveSupport::TestCase
  include AuthHelper
  include FactoryBot::Syntax::Methods
end
