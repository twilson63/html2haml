require "bundler"
Bundler.require

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '.')
require 'html2haml'

set :environment, :production
disable :run

run Sinatra::Application