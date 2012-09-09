require "bundler"
Bundler.require

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '.')
require 'server'

set :environment, :production
disable :run

configure :production do
  require 'newrelic_rpm'
end

run Sinatra::Application