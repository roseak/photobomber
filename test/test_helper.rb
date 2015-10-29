require "SimpleCov"
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'webmock'
require 'vcr'

VCR.configure do |c|
 c.allow_http_connections_when_no_cassette = true
 c.cassette_library_dir = 'test/fixtures/vcr_cassettes'
 c.hook_into :webmock
 c.default_cassette_options = { :serialize_with => :json }
 c.before_record do |r|
   r.request.headers.delete("Authorization")
 end
end

class ActiveSupport::TestCase
 fixtures :all
end
