require 'rspec'
require 'locaweb-emailmarketing'
require 'pry'
require 'vcr'
require 'webmock'

VCR.configure do |conf|
  conf.default_cassette_options = { :match_requests_on => [:uri, :method, :body, :headers] }
  conf.cassette_library_dir = 'spec/fixtures/cassettes'
  conf.hook_into :webmock
end

RSpec.configure do |config|
  # some (optional) config here
end