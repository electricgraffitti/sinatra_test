$LOAD_PATH.unshift File.dirname(__FILE__) + '/sinatra/lib'

require "rubygems"
require "sinatra"
require 'active_resource'
require 'sinatra/activerecord'
#require 'paperclip'

# Env Settings
Time.zone = "Pacific Time (US & Canada)"
ActiveRecord::Base.time_zone_aware_attributes = true
ActiveRecord::Base.default_timezone = "Pacific Time (US & Canada)"

# Set DB connection

  # configure :development do
  #   ActiveRecord::Base.establish_connection(
  #     :adapter => 'mysql',
  #     :username => 'root',
  #     :password => '',
  #     :database => 'cube_production',
  #     :host => '216.194.127.243',
  #     :encoding => 'utf8'
  #   )
  # end
  # 
  # configure :production do
  #   ActiveRecord::Base.establish_connection(
  #     :adapter => 'mysql',
  #     :username => 'root',
  #     :password => '',
  #     :database => 'cube_production',
  #     :host => '216.194.127.243',
  #     :encoding => 'utf8'
  #   )
  # end


# Establish the Object
  class Blog < ActiveResource::Base
    self.site = "http://www.cube2media.com"
  end

get "/" do
  erb :home
end

get "/blog" do
  @posts = Blog.find(:all)
  erb :blog, :locals => {:posts => @posts}
end

get "/blog_post/:id" do
  @post = Blog.find(params[:id])
  erb :blog_post, :locals => {:post => @post}
end