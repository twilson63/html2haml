$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..')
require 'html2haml'

require 'rspec'
require 'rack/test'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end