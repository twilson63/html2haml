$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..')
require 'server'

require 'rspec'
require 'rack/test'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
