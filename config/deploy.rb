#========================
#CONFIG
#========================
set :user, "rails"
set :base_folder, "iphoneapps"
set :app_name, "sinatra_base"
set :domain, "hcirack"

set :scm, :git
set :repository, "git@github.com:electricgraffitti/sinatra_test.git"
set :branch, "master"

set :deploy_to, "/var/www/#{base_folder}/#{app_name}"

set :ssh_options, { :forward_agent => true }
set :use_sudo, false

# set :port, "9191"

server "#{domain}", :app, :web, :db, :primary => true

# Callbacks
after "deploy:setup", "base_app:install_dependencies"
after "deploy:setup", "base_app:set_permissions"

#========================
#CUSTOM
#========================
namespace :deploy do 
  task :restart, :roles => :app do
    run "mkdir -p #{release_path}/tmp && touch #{release_path}/tmp/restart.txt"
  end
end
