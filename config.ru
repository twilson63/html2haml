require "rubygems"
#require "bundler"
#Bundler.require
require 'html2haml.rb'

set :environment, :production
disable :run

run Sinatra::Application