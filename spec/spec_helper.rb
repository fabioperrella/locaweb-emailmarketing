require 'rspec'
require 'locaweb-emailmarketing'
require 'pry'
require 'vcr'
require 'webmock'

AUTH_TOKEN = 'Nt5skc1xXsvKKSsyp3Bsx7ABNdJz9pc1uA9kyTdjnJkr'
BASE_URL = 'https://emailmarketing.locaweb.com.br/api/v1'
TRIAL_ACCOUNT_ID = "50f8e28abf8d79f935000001"

Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

VCR.configure do |conf|
  conf.default_cassette_options = { :match_requests_on => [:uri, :method, :body, :headers] }
  conf.cassette_library_dir = 'spec/fixtures/cassettes'
  conf.hook_into :webmock
end

RSpec.configure do |config|
  # some (optional) config here
end