require 'rubygems'
require 'sinatra'
require 'app.rb'

set :environment, :production

run Sinatra::Application
