
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'spec_helper'
require 'webmock/rspec'
require 'rspec/rails'
require 'capybara/rails'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data('<ACCESS-TOKEN>') { ENV['CONTENTFUL_ACCESS_TOKEN'] }
  config.filter_sensitive_data('<SPACE-ID>') { ENV['CONTENTFUL_SPACE_ID'] }
  config.filter_sensitive_data('<ENVIRONMENT>') { ENV['CONTENTFUL_ENVIRONMENT'] }
  config.configure_rspec_metadata!
end

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

def stub_json(verb:, url:, filename:, code: 200)
  json_response = File.open("./fixtures/#{filename}")
  stub_request(verb, url).to_return(status: code, body: json_response)
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.use_active_record = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
