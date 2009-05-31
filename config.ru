require 'sinatra'

set :environment, :development
disable :run


require 'html2haml.rb'

run Sinatra::Application