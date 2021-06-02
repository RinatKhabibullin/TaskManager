ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'simplecov'
require 'coveralls'

SimpleCov.start 'rails' do
  if ENV['CI']
    formatter Coveralls::SimpleCov::Formatter
  end
end

Rails.application.eager_load!

class ActiveSupport::TestCase
  include ActionMailer::TestHelper
  include AuthHelper
  include FactoryBot::Syntax::Methods
end
