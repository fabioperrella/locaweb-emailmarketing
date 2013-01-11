require 'rspec'
require 'locaweb-emailmarketing'
require 'pry'
require 'vcr'
require 'webmock'

AUTH_TOKEN = 'Nt5skc1xXsvKKSsyp3Bsx7ABNdJz9pc1uA9kyTdjnJkr'
BASE_URL = 'https://emailmarketing.locaweb.com.br/api/v1'
TRIAL_ACCOUNT_ID = "50efa80abf8d79a55b000001"

VCR.configure do |conf|
  conf.default_cassette_options = { :match_requests_on => [:uri, :method, :body, :headers] }
  conf.cassette_library_dir = 'spec/fixtures/cassettes'
  conf.hook_into :webmock
end

RSpec.configure do |config|
  # some (optional) config here
end