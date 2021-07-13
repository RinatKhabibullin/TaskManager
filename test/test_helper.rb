ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'simplecov'
require 'coveralls'
require 'sidekiq/testing'

Sidekiq::Testing.inline!

if ENV['CI']
  SimpleCov.start('rails') do
    formatter Coveralls::SimpleCov::Formatter
  end
end

Rails.application.eager_load!

class ActiveSupport::TestCase
  include ActionMailer::TestHelper
  include AuthHelper
  include FactoryBot::Syntax::Methods
end
