require "rubygems"
require "sinatra"
require 'dm-core'
require 'sinatra/activerecord'

# Set DB connection

  configure :development do
    ActiveRecord::Base.establish_connection(
      :adapter => 'mysql',
      :username => 'root',
      :password => '',
      :database => 'hci_development',
      :host => 'localhost',
      :encoding => 'utf8'
    )
  end
  
  # DataMapper.setup(:default, {
  #    :adapter  => 'mysql',
  #    :database => "hci_development",
  #    :username => 'root',
  #    :password => '',
  #    :host     => 'localhost'
  #  })
  

# Establish the Object
  class Service < ActiveRecord::Base
    
  end

# App Routes

  get "/" do
    @services = Service.all
    erb :home, :locals => {:services => @services}
  end
  
  get "/service/:id" do
    @service = Service.find(params[:id])
    erb :service, :locals => {:s => @service}
  end
  
